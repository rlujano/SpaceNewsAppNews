
import Foundation
import CoreEntities

protocol ArticlesListingCaseProtocol {
    func execute(completion: @escaping (Result<[ItemArticle], Error>) ->Void ) -> Void
}

final class ArticlesListingUseCase: ArticlesListingCaseProtocol{
    
    private let articlesRepository: ArticlesRepositoryProtocol
    
    init(articlesRepository: ArticlesRepositoryProtocol) {
        self.articlesRepository = articlesRepository
    }
    
    func execute(completion: @escaping (Result<[CoreEntities.ItemArticle], Error>) -> Void) -> Void{
        articlesRepository.performListRequest(completion: { result in
            completion(result)
        })
    }
    
   
}
