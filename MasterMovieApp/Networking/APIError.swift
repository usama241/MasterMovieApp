import Foundation

enum APIError: LocalizedError {
    case customError(String)
    
    public var errorDescription: String? {
        switch self {
        case .customError(let message):
            return message
        }
    }
}

