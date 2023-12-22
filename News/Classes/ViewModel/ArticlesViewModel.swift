
import CoreEntities
import CoreApp

protocol ArticlesViewModelDelegateProtocol: AnyObject {
    
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
    

    
    /*func getArticleImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
        let session = URLSession.shared
        let url = URL(string: urlString)
            
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("getImage correctly")
                completionHandler(data)
                
            } else {
                completionHandler(nil)
            }
        }
            
        dataTask.resume()
    }*/
        
    

}
