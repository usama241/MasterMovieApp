//
//  APIRouter.swift
//  JSZindigi
//
//  Created by Anis Ur Rehman on 13/06/2023.
//

import Foundation

public enum HTTPMethod: String {
     case get     = "GET"
     case post    = "POST"
}


enum APIRouter {

     case getUserWalletSetting(mobile: String)
     
     var method: HTTPMethod {
          return .post
     }
     
     //Endpoint for each API call
     var path: String {
          switch self {

          case .getUserWalletSetting:
               return "/movie-details"
         
          }
     }
     
     // Parameters for each API call
     var parameters: [String: String] {
          return [:]
     }
     // Headers for each API call
     var headers: [String: String] {
          // Common headers
          let headers: [String: String] = [
               "Accept": "application/json",
               "Content-Type": "application/json",
               "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OWNlNTlhMjUwNzIyMjYwNzgyM2E2YTk5ZjhkMWI0YiIsIm5iZiI6MTc1MTM3MTY3MC4wNTIsInN1YiI6IjY4NjNjZjk2YTMyYmQ0OWQ1MzQ5NTYyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GWsjrm6qzY2T3wWe5JJm2YdWtUReDINOvrWYhW5UJus",
               "Access_Token": "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OWNlNTlhMjUwNzIyMjYwNzgyM2E2YTk5ZjhkMWI0YiIsIm5iZiI6MTc1MTM3MTY3MC4wNTIsInN1YiI6IjY4NjNjZjk2YTMyYmQ0OWQ1MzQ5NTYyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GWsjrm6qzY2T3wWe5JJm2YdWtUReDINOvrWYhW5UJus"
          ]
          return headers
     }
     
     var body: [String: Any] {
          var body: [String: Any]
          switch self {
  
          case .getUserWalletSetting(mobile: let mobile):
              body = [:]
          }
         return body
     }
     
     var baseURL: String {
          switch self {
          default:
               return Constants.apiBaseURL
          }
     }
}

