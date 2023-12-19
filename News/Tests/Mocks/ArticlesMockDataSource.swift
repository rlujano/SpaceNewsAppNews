@testable import News
class ArticlesMockDataSource: ArticlesDataSourceProtocol {
    func list(completion: @escaping (Result<ArticlesResponseDTO, Error>)->Void) {
        do{
            let responseDTO = try JSONDecoder().decode(ArticlesResponseDTO.self, from: Data(JSONDataProvider.booksDTOResponse.utf8))
            completion(.success(responseDTO))
        } catch {
            completion(.failure(error))
        }
    }
}
