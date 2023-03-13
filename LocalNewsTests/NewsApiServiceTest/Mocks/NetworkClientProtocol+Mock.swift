import Foundation

struct MockNetworkClientWhenReturnIsEmpty: NetworkClientProtocol {
    func execute(request: URLRequest) async -> Result<Data, ResponseError> {
        .success(emptyArticles)
    }
}

struct MockNetworkClientWhenReturnIsNotEmpty: NetworkClientProtocol {
    func execute(request: URLRequest) async -> Result<Data, ResponseError> {
        .success(data)
    }
}

struct MockNetworkClientWhenReturnIsFailure: NetworkClientProtocol {
    func execute(request: URLRequest) async -> Result<Data, ResponseError> {
        .failure(.badConnexion)
    }
}
