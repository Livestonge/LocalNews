import XCTest
@testable import LocalNews

final class NewsUseCaseTests: XCTestCase {
    
    func testEmptyListCase() async {
        let sut = NewsUseCase(
            fetchNewsRepository: MockFetchNewsRepositoryWhenReturnIsEmpty()
        )
        
        let result = await sut.fetchHeadlines(
            parameters: ["language":"fr"]
        )
        
        switch result {
        case .success(let headlines):
            let mocks = headlines.convertToEntityMocks()
            XCTAssertEqual(mocks, [])
        case .failure(let error):
            XCTFail(error.description)
        }
    }
    
    func testNonEmptyListCase() async {
        let sut = NewsUseCase(
            fetchNewsRepository: MockFetchNewsRepositoryWhenReturnIsNotEmpty()
        )
        
        let result = await sut.fetchHeadlines(
            parameters: ["language":"fr"]
        )
        
        switch result {
        case .success(let headlines):
            let mocks = headlines.convertToEntityMocks()
            let expected = Array<HeadlineEntity>.nonEmpty.convertToEntityMocks()
            XCTAssertEqual(mocks, expected)
        case .failure(let error):
            XCTFail(error.description)
        }
    }
    
    func testFailureCase() async {
        let sut = NewsUseCase(
            fetchNewsRepository: MockFetchNewsRepositoryWhenReturnIsFailure()
        )
        
        let result = await sut.fetchHeadlines(
            parameters: ["language":"fr"]
        )
        
        switch result {
        case .success(let headlines):
            let mocks = headlines.convertToEntityMocks()
            XCTFail("\(mocks)")
        case .failure(let error):
            XCTAssertEqual(error, .networkError)
        }
    }
    
    

}

