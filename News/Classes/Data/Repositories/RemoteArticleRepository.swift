
import CoreEntities

final class RemoteArticleRepository: ArticlesRepositoryProtocol {
    var dataSource: ArticlesDataSourceProtocol
    
    init(dataSource: ArticlesDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func performListRequest(completion: @escaping (Result<[ItemArticle], Error>) -> Void ) {
        dataSource.list(completion: {result in
            switch result {
            case .success(let articleResponseDTO):
                var articlesDomainArray: [ItemArticle] = []
                print(articlesDomainArray)
                for article in articleResponseDTO.articles {
                    let domainArticle = article.toDomainArticle()
                    print(domainArticle)
                    articlesDomainArray.append(domainArticle)
                }
                completion(.success(articlesDomainArray))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
}
