// Generated using Sourcery 2.0.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
@testable import LocalNews

class FetchNewsRepositoryProtocolMock: FetchNewsRepositoryProtocol {




    //MARK: - fetchHeadlines

    var fetchHeadlinesParametersCallsCount = 0
    var fetchHeadlinesParametersCalled: Bool {
        return fetchHeadlinesParametersCallsCount > 0
    }
    var fetchHeadlinesParametersReceivedParameters: [String: String]?
    var fetchHeadlinesParametersReceivedInvocations: [[String: String]] = []
    var fetchHeadlinesParametersReturnValue: Result<[HeadlineEntity], FetchNewsError>!
    var fetchHeadlinesParametersClosure: (([String: String]) async -> Result<[HeadlineEntity], FetchNewsError>)?

    func fetchHeadlines(parameters: [String: String]) async -> Result<[HeadlineEntity], FetchNewsError> {
        fetchHeadlinesParametersCallsCount += 1
        fetchHeadlinesParametersReceivedParameters = parameters
        fetchHeadlinesParametersReceivedInvocations.append(parameters)
        if let fetchHeadlinesParametersClosure = fetchHeadlinesParametersClosure {
            return await fetchHeadlinesParametersClosure(parameters)
        } else {
            return fetchHeadlinesParametersReturnValue
        }
    }

}
