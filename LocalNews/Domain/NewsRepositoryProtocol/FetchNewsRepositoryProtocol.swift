import Foundation

protocol FetchNewsRepositoryProtocol {
    func fetchHeadlines(
        parameters: [String: String]
    ) async -> Result<[HeadlineEntity], FetchNewsError>
}
