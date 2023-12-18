//
//  DataSourceTest.swift
//  News-Unit-IntegratedTest
//
//  Created by Rene Lujano Laura on 17/12/23.
//

import XCTest

@testable import News

class ArticlesDataSourceTest: XCTestCase {
    func testDataSourceListing() {
        let exp = expectation(description: "backend is returning data")
        var success: Bool = false
        
        let dataSource = ArticlesRemoteDataSource()
        dataSource.list(completion: { result in
            switch result {
            case .success(let articlesResponseDTO):
                success = true
                print(articlesResponseDTO)
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
