//
//  NetworkController.swift
//  Cat Giffy
//
//  Created by M W on 19/01/2022.
//

import Combine
import Foundation
import SwiftUI

enum ImageType {
    case images
    case gifs
}

protocol NetworkControllerProtocol: AnyObject {
    typealias Headers = [String: Any]

    func get<T>(type: T.Type,
                url: URL,
                headers: Headers
    ) -> AnyPublisher<T, Error> where T: Decodable
}

final class NetworkController: NetworkControllerProtocol {
    func get<T: Decodable>(type: T.Type,
                           url: URL,
                           headers: Headers
    ) -> AnyPublisher<T, Error> {
        var urlRequest = URLRequest(url: url)

        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

protocol CatLogicControllerProtocol: AnyObject {
    var networkController: NetworkControllerProtocol { get }

    func getCats(page: Int, imageType: ImageType) -> AnyPublisher<[Cat], Error>
}

final class CatLogicController: CatLogicControllerProtocol {
    let networkController: NetworkControllerProtocol

    init(networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }

    func getCats(page: Int, imageType: ImageType) -> AnyPublisher<[Cat], Error> {
        let endpoint = Endpoint.search(count: 100, page: page, imageType: imageType)
        print("debug.get.cats=\(endpoint.url)")
        return networkController.get(type: [Cat].self,
                                     url: endpoint.url,
                                     headers: endpoint.headers)
    }
}
