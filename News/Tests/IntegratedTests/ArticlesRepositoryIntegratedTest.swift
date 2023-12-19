//
//  BooksRepositoryIntegratedTest.swift
//  News-Unit-IntegratedTest
//
//  Created by Rene Lujano Laura on 18/12/23.
//

import XCTest

@testable import News

class ArticlesRepositoryTest: XCTestCase {
    func testRepositoryListing() {
        let exp = expectation(description: "backend is returning data and can obtain domain entities")
        var success: Bool = false
        let dataSource = ArticlesRemoteDataSource()
        let repository = RemoteArticleRepository(dataSource: dataSource)
        
        repository.performListRequest(completion: { result in
            switch result {
            case .success(let domainArticlesArray):
                print(domainArticlesArray)
                success = true
            case .failure(let error):
                print(error)
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
