import XCTest
@testable import LocalNews

final class NewsApiServiceTest: XCTestCase {
    
    func testNewsApiServiceWithEmptyReturn() async {
        let sut = NewsApiService(
            networkClient: MockNetworkClientWhenReturnIsEmpty()
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
        let sut = NewsApiService(
            networkClient: MockNetworkClientWhenReturnIsNotEmpty()
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
        let sut = NewsApiService(
            networkClient: MockNetworkClientWhenReturnIsFailure()
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
