//
//  APIKeyManager.swift
//  Cat Giffy
//
//  Created by M W on 18/01/2022.
//

import Foundation

struct APIKeyManager {
    
    var apiKey: String {
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            return apiKey
        } else {
            return ""
        }
    }
    
    
}
