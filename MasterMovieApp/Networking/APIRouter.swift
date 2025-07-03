//
//  APIRouter.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.
//

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
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OWNlNTlhMjUwNzIyMjYwNzgyM2E2YTk5ZjhkMWI0YiIsIm5iZiI6MTc1MTM3MTY3MC4wNTIsInN1YiI6IjY4NjNjZjk2YTMyYmQ0OWQ1MzQ5NTYyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GWsjrm6qzY2T3wWe5JJm2YdWtUReDINOvrWYhW5UJus"
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


