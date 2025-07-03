//
//  APIError.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.

import Foundation

enum APIError: LocalizedError {
    case customError(String)
    
    public var errorDescription: String? {
        switch self {
        case .customError(let message):
            return message
        }
    }
}

