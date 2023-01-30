//
//  Route.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 29.01.2023.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAllCategories
    
    var descrtiption: String {
        switch self {
            
        case .fetchAllCategories:
            return "/dish-categories"
        }
    }
}
