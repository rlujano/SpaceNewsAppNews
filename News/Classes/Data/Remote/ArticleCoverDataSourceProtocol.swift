//
//  BookCoverDataSourceProtocol.swift
//  News
//
//  Created by Rene Lujano Laura on 21/12/23.
//

import Foundation

protocol ArticleCoverDataSourceProtocol {
    func getCover(articleImage: String, completion: @escaping(Result<UIImage?, Error>) -> Void)
}
