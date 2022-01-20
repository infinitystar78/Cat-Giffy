//
//  Cat.swift
//  Cat Giffy
//
//  Created by M W on 19/01/2022.
//

import Foundation

// MARK: - Cat
struct Cat: Codable, CustomStringConvertible, Identifiable,Equatable {
 
    
    let breeds: [Breed]?
    let categories: [Category]?
    let id, url: String?
    let width, height: Int?
    
    static func == (lhs: Cat, rhs: Cat) -> Bool {
        return lhs.id == rhs.id && lhs.width == rhs.width
    }
}

// MARK: - Category


struct Category: Codable, CustomStringConvertible {
    let id: Int?
    let name: String?
}


struct Breed : Codable, CustomStringConvertible {
    let name: String?
}

