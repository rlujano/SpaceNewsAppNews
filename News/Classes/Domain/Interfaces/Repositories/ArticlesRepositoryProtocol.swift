
protocol ArticlesRepositoryProtocol {
    func performListRequest(completion: @escaping (Result<[Article], Error>) -> Void ) -> Void
}
