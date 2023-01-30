//
//  Order.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 27.01.2023.
//

import Foundation

struct Order: Decodable {
    let id, name: String?
    let dish: Dish?
}
