//
//  AllDishes.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 30.01.2023.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
