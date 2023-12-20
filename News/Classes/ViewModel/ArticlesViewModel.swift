
import CoreEntities
import CoreApp

protocol ArticlesViewModelDelegateProtocol: class {
    
    func articlesEvent(state: ViewControllerState)
}

protocol ArticlesViewModelProtocol {
    var delegate: ArticlesViewModelDelegateProtocol? { get set }
    var articles: [ItemArticle]? {get set}
    func requestList()
}

final class ArticlesViewModel: ArticlesViewModelProtocol {
    var useCase: ArticlesListingUseCase
    var articles: [ItemArticle]?
    weak var delegate: ArticlesViewModelDelegateProtocol?

    init(useCase: ArticlesListingUseCase) {
        self.useCase = useCase
    }
    
    func requestList() {
        
        delegate?.articlesEvent(state: .loading)
        useCase.execute(completion: { [weak self] result in
                            switch result {
                                case .success(let response):
                                    self?.articles = response
                                self?.delegate?.articlesEvent(state: .success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                self?.delegate?.articlesEvent(state: .error)
                            }
                        })
    }
}
