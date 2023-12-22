//
//  ImageArticleTaskIntegratedTest.swift
//  News-Unit-IntegratedTest
//
//  Created by Rene Lujano Laura on 20/12/23.
//

import XCTest

@testable import News

class ImageArticleTaskTest: XCTestCase {
    func testTaskEndpointCall() {
        let exp = expectation(description: "Obtain image article image from URL")
        var success: Bool = false
        let urlImage = "https://cdn.arstechnica.net/wp-content/uploads/2023/01/GPS-III-6-Jan-2023-0667-2.jpg"
        ImageArticlesTask.doRequest(
            imageURL: urlImage,
            completion: { result in
            switch result {
            case .success(let imgArticle):
                print(imgArticle)
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
