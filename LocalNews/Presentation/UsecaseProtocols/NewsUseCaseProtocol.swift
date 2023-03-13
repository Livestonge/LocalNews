import Foundation

protocol NewsUseCaseProtocol {
    func fetchHeadlines(
        parameters: [String: String]
    ) async -> Result<[HeadlineEntity], FetchNewsError>
}
