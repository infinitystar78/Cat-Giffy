//
//  ContentViewModel.swift
//  Cat Giffy
//
//  Created by M W on 19/01/2022.
//

import Combine
import Foundation

class ContentViewModel: ObservableObject {
    let networkController = NetworkController()
    var subscriptions = Set<AnyCancellable>()
    @Published var cats = [Cat]()
    var currentPage = 0
    var headlineTitle = "Todays Kitties"
    var pickerTitle = "Select Image Type?"
    var loadingTitle = "Loading more cool cats"
    var placeholderImageName = "photo"

    func getImages(imageType: ImageType) {
        let catLogicController = CatLogicController(networkController: networkController)
        catLogicController.getCats(page: currentPage, imageType: imageType)
            .sink(receiveCompletion: { completion in
                self.currentPage += 1
                switch completion {
                case let .failure(error):
                    print("ERROR: Couldn't get images: \(error)")
                case .finished: break
                }
            }) { cats in
                print(cats)

                var filtered = [Cat]()
                cats.forEach { object in
                    object.categories?.forEach({ catObject in
                        if catObject.name != "hat" {
                            filtered.append(object)
                        }
                    })
                }
                DispatchQueue.main.async {
                    self.cats.append(contentsOf: filtered)
                }
            }

            .store(in: &subscriptions)
    }
}
