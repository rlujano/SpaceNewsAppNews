//
//  ArticlesViewModelTest.swift
//  News-Unit-UnitTests
//
//  Created by Rene Lujano Laura on 19/12/23.
//

import XCTest

@testable import News

class ArticlesViewModelUnitTest: XCTestCase {
    func testRequestList() {
        //let exp = expectation(description: "The view model makes a request an to the useCase and recive data")
        //var success: Bool = false
        let dataSource = ArticlesMockDataSource()
        let repository = RemoteArticleRepository(dataSource: dataSource)
        
        let useCase = ArticlesListingUseCase(articlesRepository: repository)
        
        let viewModel = ArticlesViewModel(useCase: useCase)
        let viewModelSpy = ArticlesViewModelDelegateSpy()
        viewModel.delegate = viewModelSpy
        viewModel.requestList()

        //waitForExpectations(timeout: 30) { error in
        //    if let error = error {
        //        XCTFail("waitForExpectationWithTimeout errored: \(error)")
        //    }
        XCTAssertNotNil(viewModel.articles)
        XCTAssertEqual(viewModelSpy.currentState, 1)
        //}
    }
}
