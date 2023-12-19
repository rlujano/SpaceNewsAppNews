//
//  ArticlesListingUseCaseTest.swift
//  News-Unit-UnitTests
//
//  Created by Rene Lujano Laura on 19/12/23.
//


import XCTest

@testable import News

class ArticlesListingUseCaseUnitTest: XCTestCase {
    func testExecuteListing() {
        let exp = expectation(description: "The use case calls the repository")
        var success: Bool = false
        let dataSource = ArticlesMockDataSource()
        let repository = RemoteArticleRepository(dataSource: dataSource)
        
        let useCase = ArticlesListingUseCase(articlesRepository: repository)
        
        useCase.execute(completion: { result in
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
