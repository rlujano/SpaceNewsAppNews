//
//  ArticlesDataSourceProtocol.swift
//  News
//
//  Created by Rene Lujano Laura on 17/12/23.
//

protocol ArticlesDataSourceProtocol {
    func list(completion: @escaping (Result<ArticlesResponseDTO, Error>) -> Void)
}

