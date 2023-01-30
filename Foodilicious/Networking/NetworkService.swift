//
//  NetworkService.swift
//  Foodilicious
//
//  Created by Ali Görkem Aksöz on 29.01.2023.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    func fetchAllCategories(completion: @escaping (Result<AllDishes, AppError>) -> ()) {
        request(route: .fetchAllCategories, method: .get, completion: completion)
    }
    
    func placeOrder(dishId: String, name: String, completion: @escaping (Result<Order, AppError>) -> ()) {
        let params = ["name": name]
        request(route: .placeOrder(dishId), method: .post,parameters: params, completion: completion)
    }
    
    func fetchCategoryDishes(categoryId: String, completion: @escaping (Result<[Dish], AppError>) -> ()) {
        request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
    }
    
    private func request<T: Decodable>(route: Route,
                                     method: Method,
                                     parameters: [String: Any]? = nil,
                                     completion: @escaping (Result<T, AppError>) -> Void
    ) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let _ = String(data: data, encoding: .utf8) ?? "Could not stringfy response"
//                print("The response is:\n \(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("The error is: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
            
        }.resume()
    }
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?,
                                completion: (Result<T, AppError>) -> Void ) {
        guard let result = result else {
            completion(.failure(.unknownError))
            return
        }
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(.serverError(error)))
                return
            }
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(.unknownError))
            }
            
        case .failure(let error):
            completion(.failure(error as! AppError))
        }
    }
    
    /// This function help us to generate a URLRequest
    /// - Parameters:
    ///   - route: the path to the resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information you need to pass to the backend
    /// - Returns: URLRequest
    private func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.descrtiption
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponenet = URLComponents(string: urlString)
                urlComponenet?.queryItems = params.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
                urlRequest.url = urlComponenet?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }

}
