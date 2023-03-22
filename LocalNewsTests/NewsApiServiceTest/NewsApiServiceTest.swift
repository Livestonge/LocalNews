import XCTest
@testable import LocalNews

final class NewsApiServiceTest: XCTestCase {
    
    func testNewsApiServiceWithEmptyReturn() async {
        let mock = NetworkClientProtocolMock()
        mock.executeRequestReturnValue = .success(emptyArticles)
        let sut = NewsApiService(
            networkClient: mock
        )
        let result = await sut.fetchHeadlines(parameters: ["language":"fr"])
        
        switch result {
        case .success(let headlines):
            let mocks = headlines.convertToMocks()
            XCTAssertEqual(mocks, [])
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }
    
    func testNonEmptyReturn() async {
        let mock = NetworkClientProtocolMock()
        mock.executeRequestReturnValue = .success(data)
        let sut = NewsApiService(
            networkClient: mock
        )
        let result = await sut.fetchHeadlines(parameters: ["language":"fr"])
        
        switch result {
        case .success(let headlines):
            let mocks = headlines.convertToMocks()
            let expected = Array<HeadlineDTO>.decodedHeadlineDTO.convertToMocks()
            XCTAssertEqual(mocks, expected)
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }
    
    func testFailureCase() async {
        let mock = NetworkClientProtocolMock()
        mock.executeRequestReturnValue = .failure(.badConnexion)
        let sut = NewsApiService(
            networkClient: mock
        )
        let result = await sut.fetchHeadlines(parameters: ["language":"fr"])
        
        switch result {
        case .success(let headlines):
            let mocks = headlines.convertToMocks()
            XCTFail("\(mocks)")
        case .failure(let error):
            XCTAssertEqual(error, .badConnexion)
        }
    }

}
