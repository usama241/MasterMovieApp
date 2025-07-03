//
//  MovieListViewModel.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.
//

import Foundation

class MovieListViewModel {
    let service: MovieServices!
    @Published var moviesList: [MoviesListResults]?
    @Published var progressing: Bool = false
 
    //MARK: - Init
    init(service: MovieServices) {
        self.service = service
    }
}

extension MovieListViewModel {
    
    func moviesList() async throws -> MoviesListResponse {
        do{
            progressing = true
            let response  = try await service.moviesList()
            self.moviesList = response.results
            progressing = false
            return response
        } catch {
            progressing = false
            throw error
        }
    }
}

