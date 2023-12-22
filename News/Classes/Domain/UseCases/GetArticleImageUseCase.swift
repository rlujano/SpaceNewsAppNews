//
//  GetArticleImageUseCase.swift
//  News
//
//  Created by Rene Lujano Laura on 21/12/23.
//

import Foundation
import CoreEntities

protocol GetArticleImageUseCaseProtocol {
    func execute(urlImage: String, completion: @escaping (Result<UIImage?, Error>) ->Void ) -> Void
}

final class GetArticleImageUseCase: GetArticleImageUseCaseProtocol{
    private var articlesImageRepository: ArticleImageRepositoryProtocol?

    init(articlesImageRepository: ArticleImageRepositoryProtocol) {
        self.articlesImageRepository = articlesImageRepository
    }
    
    init(){}
    
    func execute(
        urlImage: String,
        completion: @escaping (Result<UIImage?, Error>) -> Void) {
            articlesImageRepository?.performImageRequest(
                urlImage: urlImage,
                completion: { result in
                    completion(result)
                })
    }
   
}
