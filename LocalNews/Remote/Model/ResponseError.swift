import Foundation

enum ResponseError: Error {
    case serverResponseError,
         badUrlError,
         badConnexion,
         decodingError,
         badServerData,
         unknown
}
