import Foundation

struct FetchNewsRepository: FetchNewsRepositoryProtocol {
    
    let dataSource: any FetchNewsRemoteProtocol
    
    init(dataSource: any FetchNewsRemoteProtocol) {
        self.dataSource = dataSource
    }
    
    func fetchHeadlines(
        parameters: [String: String]
    ) async -> Result<[HeadlineEntity], FetchNewsError> {
        let result = await dataSource.fetchHeadlines(parameters: parameters)
        switch result {
        case .success(let headlines):
            return .success(headlines.map{ $0.convertToDomain() })
        case .failure(let responseError):
            print("[ResponseError]: \(responseError)")
            switch responseError {
            case .serverResponseError, .badConnexion:
                return.failure(.networkError)
            default:
                return .failure(.internalError)
            }
        }
    }
    
    
}
