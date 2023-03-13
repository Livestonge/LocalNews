import Foundation

enum FetchNewsError: CustomStringConvertible, Error {
    case networkError, internalError, unknown
    
    var description: String {
        switch self {
        case .networkError:
            return "Please check that you are connected to Internet and retry"
        case .internalError, .unknown:
            return "Whoops something went wrong, please retry later"
        default:
            return ""
            
        }
    }
}
