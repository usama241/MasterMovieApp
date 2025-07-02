//
//  MovieServices.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.
//

import Foundation

protocol ZTagServicesProtocol {
    
    init(apiClient: APIClientProtocol)
    
    func moviesList() async throws -> MoviesListResponse

}

class ZTagServices: ZTagServicesProtocol {
    let apiClient: APIClientProtocol
    
    required init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func moviesList() async throws -> MoviesListResponse {
        let router = APIRouter.getUserWalletSetting(mobile: "033")
        let response: APIResponse<MoviesListResponse> = try await apiClient.sendRequest(router)
        
        guard let apiResponse = response.result else {
            throw APIError.other("Unable to process at the moment.")
        }

        guard !apiResponse.results.isEmpty else {
            throw APIError.other("No movies found.")
        }

        return apiResponse
    }


    
}
