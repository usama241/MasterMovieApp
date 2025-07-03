import Foundation

class MovieDetailsViewModel {
    private let service: MovieServices
    private let selectedMovieId: Int

    var movieDetails: Movie?
    @Published var movieFetched: Bool = false
 
    //MARK: - Init
    init(service: MovieServices, selectedMovieId: Int) {
        self.service = service
        self.selectedMovieId = selectedMovieId
    }
}

extension MovieDetailsViewModel {
    
    func fetchMovieDetail() async throws {
        let response  = try await service.movieDetail(selectedMovieId: selectedMovieId)
        self.movieDetails = response
        movieFetched = true
    }
}

