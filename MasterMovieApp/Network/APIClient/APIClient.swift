//
//  APIClient.swift
//  JSZindigi
//
//  Created by Anis Ur Rehman on 09/06/2023.
//

import Foundation

struct APIResponse<T: Decodable> {
    let httpStatusCode: Int
    let result: T
}

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

protocol APIClientProtocol {
    init(urlSession: URLSessionProtocol)
    func sendRequest<T: Decodable>(_ router: APIRouter) async throws -> APIResponse<T>
}

extension URLSession: URLSessionProtocol {
}

struct APIClient: APIClientProtocol {
    let urlSession: URLSessionProtocol
    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }
    
    func sendRequest<T: Decodable>(_ router: APIRouter) async throws -> APIResponse<T> {
        var dataResponse: (Data, URLResponse)!
        
        do {
            guard let request = self.makeURLRequest(router: router) else {
                throw APIError.other("Bad request")
            }
            dataResponse = try await urlSession.data(for: request)
        } catch {
            print(error)
            if let error = error as NSError?, error.domain == NSURLErrorDomain, error.code == NSURLErrorNotConnectedToInternet {
                throw APIError.noInternet
            } else {
                throw APIError.unexpectedError
            }
        }
        
        do {
            guard let httpResponse = dataResponse.1 as? HTTPURLResponse else {
                throw APIError.unexpectedError
            }
            
            let statusCode = httpResponse.statusCode
            let data = dataResponse.0
            print("Status Code: \(statusCode)")
            print("Response Body: \(String(decoding: data, as: UTF8.self))")
            
            switch statusCode {
            case 200...210:
                if statusCode == 203,
                   let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    throw APIError.other(errorResponse.responseMessage ?? errorResponse.body?.first ?? APIError.unexpectedError.localizedDescription)
                }
                
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    return APIResponse(httpStatusCode: statusCode, result: result)
                } catch {
                    print("JSON Parsing Error: \(error.localizedDescription)")
                    throw APIError.jsonParsing
                }

            case 401:
                throw APIError.unauthorized

            case 404:
                throw APIError.notFound

            case 500...599:
                throw APIError.internlServerError

            default:
                throw APIError.other("Something went wrong")
            }
        } catch {
            throw error
        }
    }

}

//MARK: - Private Functions
extension APIClient {
    /// Genrate URLReqeust object from path, method and paramters
    private func makeURLRequest(router: APIRouter) -> URLRequest? {
        guard var urlComponent = URLComponents(string: router.baseURL) else {
            return nil
        }
        // End point
        urlComponent.path.append(router.path)

        let parameters = router.parameters
        var urlRequest: URLRequest?
        
        switch router.method {
        case .get:
            // Parameters
            var queryItems: [URLQueryItem] = []
            for (key, value) in parameters {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
            urlComponent.queryItems = queryItems
            guard let url = urlComponent.url else {
                return nil
            }
            urlRequest = URLRequest(url: url)
            
        case .post:
            // Body
            guard let url = urlComponent.url else {
                return nil
            }
            urlRequest = URLRequest(url: url)
            let body = try? JSONSerialization.data(withJSONObject: router.body)
            urlRequest?.httpBody = body
            let bodyString = String(data: body!, encoding: .utf8)
            print(bodyString!)
        }
        print(urlRequest?.url ?? "")
        // Method
        urlRequest?.httpMethod = router.method.rawValue
        
        // Headers
        for (key, value) in router.headers {
            urlRequest?.setValue(value, forHTTPHeaderField: key)
        }
        print(urlRequest?.cURL(pretty: false) ?? "")
        return urlRequest
    }
}

fileprivate struct EncryptedResponse: Decodable {
    let text: String
    enum CodingKeys: String, CodingKey {
        case text = "Text"
    }
}
