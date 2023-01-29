//
//  Route.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 29.01.2023.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case temp
    
    var descrtiption: String {
        switch self {
            
        case .temp:
            return "/temp"
        }
    }
}
