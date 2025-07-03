import Foundation

protocol MovieServicesProtocol {
    
    init(apiClient: APIClientProtocol)
    
    func moviesList() async throws -> [Movie]
    func movieDetail(selectedMovieId: Int) async throws -> Movie
}

class MovieServices: MovieServicesProtocol {
    let apiClient: APIClientProtocol
    
    required init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func moviesList() async throws -> [Movie] {
        let router = APIRouter.moviePopularList
        let response: MoviesListResponse = try await apiClient.sendRequest(router)
        let fetchedMovies = response.results ?? []
        guard !fetchedMovies.isEmpty else {
            throw APIError.customError("There are no movies available right now.")
        }
        return fetchedMovies.map { movie in
            Movie(
                id: movie.id,
                adult: movie.adult,
                voteAverage: movie.vote_average,
                voteCount: movie.vote_count,
                posterURL: movie.poster_path,
                title: movie.title,
                tagLine: "",
                runtime: 0,
                rating: movie.popularity,
                releaseDate: movie.release_date,
                language: movie.original_language,
                overview: movie.overview,
                genres: [],
                productionCompanies: []
            )
        }
    }
    
    func movieDetail(selectedMovieId: Int) async throws -> Movie {
        let router = APIRouter.movieDetail(selectedMovieId: selectedMovieId)
        let response: MovieDetailResponse = try await apiClient.sendRequest(router)
        return Movie(
            id: response.id,
            adult: response.adult,
            voteAverage: response.vote_average,
            voteCount: response.vote_count,
            posterURL: response.poster_path,
            title: response.title,
            tagLine: response.tagline,
            runtime: response.runtime,
            rating: response.popularity,
            releaseDate: response.release_date,
            language: response.original_language,
            overview: response.overview,
            genres: response.genres,
            productionCompanies: response.production_companies
        )
    }
}
