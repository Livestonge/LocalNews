import Foundation

protocol NetworkClientProtocol {
    func execute(request: URLRequest) async -> Result<Data, ResponseError>
}

struct NetworClient: NetworkClientProtocol {
    private let session: URLSession
    
    init(session: URLSession = .init(configuration: .default)) {
        self.session = session
    }
    
    func execute(request: URLRequest) async -> Result<Data, ResponseError> {
        do {
            let tuple = try await session.data(for: request)
            guard let response = tuple.1 as? HTTPURLResponse,
                  (200..<300).contains(response.statusCode) == true
            else {
                return .failure(.serverResponseError)
            }
            
            guard let mimeType = response.mimeType,
                  mimeType == "application/json"
            else {
                return .failure(.badServerData)
            }
            let data = tuple.0
            
            return .success(data)
            
        } catch URLError.badURL {
            return .failure(.badUrlError)
        } catch URLError.notConnectedToInternet {
            return .failure(.badConnexion)
        } catch {
            return .failure(.unknown)
        }
        
    }
    
}
