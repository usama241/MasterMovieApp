import Foundation

class MovieListViewModel {
    let service: MovieServices!
    @Published var moviesList: [Movie]?
 
    //MARK: - Init
    init(service: MovieServices) {
        self.service = service
    }
}

extension MovieListViewModel {
    
    func moviesList() async throws {
            let response  = try await service.moviesList()
            self.moviesList = response
    }
}

