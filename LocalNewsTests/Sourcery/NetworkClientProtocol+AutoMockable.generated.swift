// Generated using Sourcery 2.0.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
@testable import LocalNews

class NetworkClientProtocolMock: NetworkClientProtocol {




    //MARK: - execute

    var executeRequestCallsCount = 0
    var executeRequestCalled: Bool {
        return executeRequestCallsCount > 0
    }
    var executeRequestReceivedRequest: URLRequest?
    var executeRequestReceivedInvocations: [URLRequest] = []
    var executeRequestReturnValue: Result<Data, ResponseError>!
    var executeRequestClosure: ((URLRequest) async -> Result<Data, ResponseError>)?

    func execute(request: URLRequest) async -> Result<Data, ResponseError> {
        executeRequestCallsCount += 1
        executeRequestReceivedRequest = request
        executeRequestReceivedInvocations.append(request)
        if let executeRequestClosure = executeRequestClosure {
            return await executeRequestClosure(request)
        } else {
            return executeRequestReturnValue
        }
    }

}
