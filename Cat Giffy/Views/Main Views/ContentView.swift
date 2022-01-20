//
//  ContentView.swift
//  Cat Giffy
//
//  Created by M W on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = ContentViewModel()

    var body: some View {
        VStack {
            Text("Todays Kitties")
                .font(.largeTitle)
            List {
                ForEach(model.cats) { cat in

                    AsyncImage(url: URL(string: cat.url!)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case let .success(image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300, maxHeight: 100)
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                    Text("Loading more cool cats")
                    .font(.body)
                    .foregroundColor(.blue)
                        .onAppear {
                            model.getImages()
                        }
            }
            
        }
        .onAppear(perform: {
            model.getImages()
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
