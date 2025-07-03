import Foundation

enum APIRouter {

     case moviePopularList
     case movieDetail(selectedMovieId: Int)

     var method: HTTPMethod {
          return .get
     }
     
     //Endpoint for each API call
     var path: String {
          switch self {
              
          case .moviePopularList:
               return "movie/popular"
          case .movieDetail(let selectedMovieId):
              return "movie/\(selectedMovieId)"
              
          }
     }
    
     // Headers for each API call
    var headers: [String: String] {
        return [
            "Accept": "application/json",
            "Authorization": Constants.bearerToken
        ]
    }
     
    // Parameters for each API call
     var parameters: [String: Any] {
         [:]
     }
     
     var baseURL: String {
          switch self {
          default:
               return Constants.apiBaseURL
          }
     }
}


