import XCTest

@testable import News

class ArticlesBackendTest: XCTestCase {
    func testTaskEndpointCall() {
        let exp = expectation(description: "backend is returning data")
        var success: Bool = false
        ArticlesTask.doRequest(completion: { result in
            switch result {
            case .success(let articlesData):
                print(articlesData)
                success = true
            case .failure(let error):
                print (error)
                success = false
            }
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationWithTimeout errored: \(error)")
            }
            XCTAssertEqual(success, true)
        }
    }
}
