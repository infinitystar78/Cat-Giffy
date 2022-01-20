//
//  Cat_GiffyTests.swift
//  Cat GiffyTests
//
//  Created by M W on 17/01/2022.
//

import XCTest
@testable import Cat_Giffy

class Cat_GiffyTests: XCTestCase {

  let model = ContentViewModel()
    
    func testHeadlineText(){
        XCTAssertEqual(model.headlineTitle, "Todays Kitties")
    }
    
    func pickerTitle(){
        XCTAssertEqual(model.pickerTitle, "Select Image Type?")
    }
    
    func loadingTitle(){
        XCTAssertEqual(model.loadingTitle, "Loading more cool cats")
    }
    
    func testplaceholderImageName(){
        XCTAssertEqual(model.headlineTitle, "photo")
    }
    
    func testSegmentedSelection(){
        let contentView = ContentView()
            contentView.changeImageType(newValue: 1)
        XCTAssertEqual(contentView.imageType, ImageType.images)
           
    }
    
    
    
}
