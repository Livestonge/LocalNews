import Foundation

struct NewsUseCase: NewsUseCaseProtocol {
    let fetchNewsRepository: any FetchNewsRepositoryProtocol
    
    init(fetchNewsRepository: any FetchNewsRepositoryProtocol) {
        self.fetchNewsRepository = fetchNewsRepository
    }
    
    func fetchHeadlines(
        parameters: [String: String]
    ) async -> Result<[HeadlineEntity], FetchNewsError> {
        let result = await fetchNewsRepository.fetchHeadlines(
            parameters: parameters
        )
        
        switch result {
        case .success(let entities):
            return .success(entities)
        case .failure(let error):
            return .failure(error)
        }
    }
}
