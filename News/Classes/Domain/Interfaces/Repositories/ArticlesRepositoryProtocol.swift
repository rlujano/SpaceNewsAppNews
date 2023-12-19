import CoreEntities

protocol ArticlesRepositoryProtocol {
    func performListRequest(completion: @escaping (Result<[ItemArticle], Error>) -> Void ) -> Void
}
