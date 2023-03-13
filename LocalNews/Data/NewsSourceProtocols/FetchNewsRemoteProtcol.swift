import Foundation

protocol FetchNewsRemoteProtocol {
    func fetchHeadlines(
        parameters: [String: String]
    ) async -> Result<[HeadlineDTO], ResponseError>
}
