//
//  AppError.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 29.01.2023.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidURL
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
           return "Response could not be decoded"
        case .unknownError:
            return "Bruhhhh !!! I have no idea what go on"
        case .invalidURL:
            return "HEYYYY !!! Give me a valid URL"
        case .serverError(let error):
            return error
        }
    }
}
