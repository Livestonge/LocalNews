import Foundation

struct MockFetchNewsRepositoryWhenReturnIsEmpty: FetchNewsRepositoryProtocol {
    func fetchHeadlines(
        parameters: [String : String]
    ) async -> Result<[HeadlineEntity], FetchNewsError> {
        .success([])
    }
}

struct MockFetchNewsRepositoryWhenReturnIsNotEmpty: FetchNewsRepositoryProtocol {
    func fetchHeadlines(
        parameters: [String : String]
    ) async -> Result<[HeadlineEntity], FetchNewsError> {
        .success(.nonEmpty)
    }
}

struct MockFetchNewsRepositoryWhenReturnIsFailure: FetchNewsRepositoryProtocol {
    func fetchHeadlines(
        parameters: [String : String]
    ) async -> Result<[HeadlineEntity], FetchNewsError> {
        .failure(.networkError)
    }
}
