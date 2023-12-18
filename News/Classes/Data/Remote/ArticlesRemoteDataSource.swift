//
//  ArticlesDataSource.swift
//  News
//
//  Created by Rene Lujano Laura on 17/12/23.
//

class ArticlesRemoteDataSource: ArticlesDataSourceProtocol {
    func list(completion: @escaping (Result<ArticlesResponseDTO, Error>) -> Void) {
        ArticlesTask.doRequest(completion: completion)
    }
}
