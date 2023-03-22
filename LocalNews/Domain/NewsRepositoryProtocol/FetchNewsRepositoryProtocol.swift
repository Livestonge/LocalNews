import Foundation

// sourcery: AutoMockable
protocol FetchNewsRepositoryProtocol {
    func fetchHeadlines(
        parameters: [String: String]
    ) async -> Result<[HeadlineEntity], FetchNewsError>
}
