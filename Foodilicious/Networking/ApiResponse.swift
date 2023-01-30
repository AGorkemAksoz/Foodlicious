//
//  ApiResponse.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 30.01.2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
