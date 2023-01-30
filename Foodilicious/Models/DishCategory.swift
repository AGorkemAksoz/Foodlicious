//
//  DishCategory.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 26.01.2023.
//

import Foundation


struct DishCategory: Decodable {
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
         
    }
}
