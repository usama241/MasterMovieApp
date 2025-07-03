//
//  URLSession.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 03/07/2025.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {
}
