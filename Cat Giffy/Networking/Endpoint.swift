//
//  Endpoint.swift
//  Cat Giffy
//
//  Created by M W on 18/01/2022.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}


extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.thecatapi.com"
        components.path = "/v1/images/search"
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }

    var secretkey: String {
        let secretKey = APIKeyManager()
        return secretKey.apiKey
    }

    var headers: [String: Any] {
        return [
            "x-api-key": secretkey,
        ]
    }
}

extension Endpoint {
    static func search(count: Int, page: Int, imageType:ImageType) -> Self {
        var type: String
        switch imageType {
        case .images:
            type = "jpg,png"
        case .gifs:
            type = "gif"
        }
        
        return Endpoint(path: "/search",
                        queryItems: [
                            URLQueryItem(name: "limit",
                                         value: "\(count)"),
                            URLQueryItem(name: "mime_types",
                                         value: "\(type)"),
                            URLQueryItem(name: "order",
                                         value: "random"),
                            URLQueryItem(name: "page",
                                         value: "\(page)"),
                            
                        ]
        )
    }
}
