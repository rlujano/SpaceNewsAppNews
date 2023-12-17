
struct ArticlesResponseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case articlesCount = "count"
        case nextKey = "next"
        case prevKey = "previous"
        case articles = "results"
    }
    let articlesCount: Int
    let nextKey: String!
    let prevKey: String!
    let articles: [Article]
}

struct Article: Decodable {
    private enum CodingKeys: String, CodingKey {
        case articleID = "id"
        case articleTitle = "title"
        case newsSite = "news_site"
        case publishDate = "published_at"
        case launches
        
    }
    let articleID: Int
    let articleTitle: String
    let newsSite: String
    let publishDate: String
    let launches: [Launch]
}

struct Launch: Decodable {
    private enum CodingKeys: String, CodingKey {
        case launchID = "launch_id"
        case provider
    }
    let launchID: String
    let provider: String
}
