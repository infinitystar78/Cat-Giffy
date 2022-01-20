//
//  ContentView.swift
//  Cat Giffy
//
//  Created by M W on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = ContentViewModel()
    @State var imageTypeSelection = 0
    @State var imageType = ImageType.gifs
    
    func changeImageType(newValue: Int) {
        if newValue == 0 {
            imageType = .gifs
            model.getImages(imageType: self.imageType)
        }

        if newValue == 1 {
            imageType = .images
            model.getImages(imageType: self.imageType)
        }
    }

    var body: some View {
        VStack {
            Text(model.headlineTitle)
                .font(.largeTitle)

            Picker(model.pickerTitle, selection: $imageTypeSelection) {
                Text("GIFs").tag(0)
                Text("Images").tag(1)
            }
            .pickerStyle(.segmented)
            .onChange(of: imageTypeSelection) { newValue in
               changeImageType(newValue: newValue)
            }

            List {
                ForEach(model.cats) { cat in

                    if imageTypeSelection == 0 {
                        GifView(urlString: cat.url!)
                            .frame(width: 300, height: CGFloat(cat.height!), alignment: .center)
                        // .frame(maxWidth: 300, maxHeight: 600)
                    }

                    if imageTypeSelection == 1 {
                        AsyncImage(url: URL(string: cat.url!)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case let .success(image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 300, maxHeight: 100)
                            case .failure:
                                Image(systemName: model.placeholderImageName)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                }
                Text(model.loadingTitle)
                    .font(.body)
                    .foregroundColor(.blue)
                    .onAppear {
                        model.getImages(imageType: self.imageType)
                    }
            }
        }
        .onAppear(perform: {
            model.getImages(imageType: self.imageType)
            print("model.cats=\(model.cats)")

        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
