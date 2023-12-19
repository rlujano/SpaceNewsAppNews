
import CoreEntities

protocol ArticlesViewModelDelegateProtocol: class {
    // Replace int by ViewControllerState implements on "Core"
    func articlesEvent(state: Int)
}

protocol ArticlesViewModelProtocol {
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
        // Replace magic number
        delegate?.articlesEvent(state: 0) // .loading
        useCase.execute(completion: { [weak self] result in
                            switch result {
                                case .success(let response):
                                    self?.articles = response
                                    self?.delegate?.articlesEvent(state: 1) // .success
                                case .failure(let error):
                                    print(error.localizedDescription)
                                    self?.delegate?.articlesEvent(state: 2) // .error
                            }
                        })
    }
}
