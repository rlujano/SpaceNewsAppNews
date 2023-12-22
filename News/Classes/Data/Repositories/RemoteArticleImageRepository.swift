//
//  RemoteArticleImageRepository.swift
//  News
//
//  Created by Rene Lujano Laura on 21/12/23.
//


import CoreEntities

final class RemoteArticleImageRepository: ArticleImageRepositoryProtocol {
    
    var dataSource: ArticleCoverDataSourceProtocol
    
    init(dataSource: ArticleCoverDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func performImageRequest(urlImage: String, completion: @escaping (Result<UIImage?, Error>) -> Void) {
        dataSource.getCover(
            articleImage: urlImage,
            completion: { result in
                switch result {
                case .success(let imageArt):
                    completion(.success(imageArt))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
    }
    
}
