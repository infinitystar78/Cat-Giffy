//
//  Network_Tests.swift
//  Cat GiffyTests
//
//  Created by M W on 19/01/2022.
//

import XCTest
@testable import Cat_Giffy

class Network_Tests: XCTestCase {
    var networkController: NetworkControllerProtocol?
    

    func testBasicRequestGeneration() {
        self.networkController = NetworkController()
        let endpoint = Endpoint.search(count: 100, page: 1, imageType: .gifs)
        _ = networkController?.get(type: [Cat].self,
                                            url: endpoint.url,
                                            headers: endpoint.headers)
        XCTAssertEqual(endpoint.url, URL(string: "https://api.thecatapi.com/v1/images/search?limit=100&mime_types=gif&order=random&page=0"))
    }
    
    func testNetworkControllerIsNotNil(){
         XCTAssertNotNil(self.networkController)
    }
    

}
