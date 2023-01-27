//
//  Dish.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 26.01.2023.
//

import Foundation

struct Dish {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
    
}
