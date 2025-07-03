//
//  MovieDetailsViewModel.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.
//

import Foundation

class MovieDetailsViewModel {
    
    //MARK: - Properties
    let service: MovieServices
    @Published var movieDetail: MovieDetailResponse?
    let selectedMovieId: Int

    //MARK: - Published
    @Published var progressing: Bool = false
 
    //MARK: - Init
    init(service: MovieServices, selectedMovieId: Int) {
        self.service = service
        self.selectedMovieId = selectedMovieId
    }
}

extension MovieDetailsViewModel {
    
    func fetchMovieDetail() async throws {
        do{
            progressing = true
            let response  = try await service.movieDetail(selectedMovieId: selectedMovieId)
            self.movieDetail = response
            progressing = false
        } catch {
            progressing = false
            throw error
        }
    }
}

