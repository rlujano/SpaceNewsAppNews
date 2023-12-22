//
//  ArticleImageRepositoryProtocol.swift
//  News
//
//  Created by Rene Lujano Laura on 21/12/23.
//

import CoreEntities

protocol ArticleImageRepositoryProtocol {
    func performImageRequest(urlImage: String, completion: @escaping (Result<UIImage?, Error>) -> Void ) -> Void
}
