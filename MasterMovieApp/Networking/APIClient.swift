//
//  APIClient.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.
//

import Foundation

protocol APIClientProtocol {
    init(urlSession: URLSessionProtocol)
    func sendRequest<T: Decodable>(_ router: APIRouter) async throws -> T
}

struct APIClient: APIClientProtocol {
    let urlSession: URLSessionProtocol
    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }
    
    func sendRequest<T: Decodable>(_ router: APIRouter) async throws -> T {
        guard let request = self.makeURLRequest(router: router) else {
            throw APIError.customError("Bad request")
        }
        let dataResponse = try await urlSession.data(for: request)
        let result = try JSONDecoder().decode(T.self, from: dataResponse.0)
        return result
    }

}


extension APIClient {
    private func makeURLRequest(router: APIRouter) -> URLRequest? {
        guard var urlComponent = URLComponents(string: router.baseURL) else {
            return nil
        }
        urlComponent.path.append(router.path)
        let parameters = router.parameters
        var urlRequest: URLRequest?
        
        switch router.method {
        case .get:
            var queryItems: [URLQueryItem] = []
            for (key, value) in parameters {
                let item = URLQueryItem(name: key, value: "\(value)")
                queryItems.append(item)
            }
            urlComponent.queryItems = queryItems
            guard let url = urlComponent.url else {
                return nil
            }
            urlRequest = URLRequest(url: url)
            
        case .post:
            guard let url = urlComponent.url else {
                return nil
            }
            urlRequest = URLRequest(url: url)
            let body = try? JSONSerialization.data(withJSONObject: router.parameters)
            urlRequest?.httpBody = body
        }
        urlRequest?.httpMethod = router.method.rawValue
        for (key, value) in router.headers {
            urlRequest?.setValue(value, forHTTPHeaderField: key)
        }
        return urlRequest
    }
}
