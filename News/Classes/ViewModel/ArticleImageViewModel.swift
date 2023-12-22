//
//  CoverViewModel.swift
//  News
//
//  Created by Rene Lujano Laura on 21/12/23.
//

import Foundation
import CoreApp

protocol ArticleImageViewModelDelegateProtocol: AnyObject {
    func articleImageEvent(state: ViewControllerState)
}

protocol ArticleImageViewModelProtocol{
    var delegate: ArticleImageViewModelDelegateProtocol? { get set }
    var articleImage: UIImage? { set get }
    
    func getImage(urlImage: String)
}


final class ArticleImageViewModel: ArticleImageViewModelProtocol {
    var delegate: ArticleImageViewModelDelegateProtocol?
    
    var articleImage: UIImage?
    
    var useCase: GetArticleImageUseCaseProtocol
    
    init(useCase: GetArticleImageUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getImage(urlImage: String) {
        delegate?.articleImageEvent(state: .loading)
        useCase.execute(
            urlImage: urlImage,
            completion: { [weak self] result in
                switch result {
                case .success(let articleImage):
                    self?.articleImage = articleImage
                    self?.delegate?.articleImageEvent(state: .success)
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.delegate?.articleImageEvent(state: .error)
                }
            })
    }
    
    
}
