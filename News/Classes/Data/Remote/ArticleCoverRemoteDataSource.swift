//
//  ArticleCoverRemoteDataSource.swift
//  News
//
//  Created by Rene Lujano Laura on 21/12/23.
//

import Foundation

class ArticleCoverRemoteDataSource: ArticleCoverDataSourceProtocol {
    func getCover(articleImage: String, completion: @escaping (Result<UIImage?, Error>) -> Void) {
        ImageArticlesTask.doRequest(imageURL: articleImage, completion: completion)
    }
}
