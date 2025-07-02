//
//  APIError.swift
//  JSZindigi
//
//  Created by Anis Ur Rehman on 12/06/2023.
//

import Foundation

enum APIError: LocalizedError {
    case jsonParsing
    case notFound
    case internlServerError
    case unexpectedError
    case unauthorized
    case noInternet
    case other(String)
    public var errorDescription: String? {
        switch self {
        case .jsonParsing:
            return "Invalid response. Please try again later."
        case .notFound:
            return "Not found"
        case .internlServerError, .unexpectedError:
            return "We are unable to process your request at this time. Please try again later."
        case .unauthorized:
            return "Your session has expired, please Login and Continue."
        case .noInternet:
            return "NET001 - Please ensure your device is connected to the internet and try again."
        case .other(let message):
            return message
        }
    }
}

