import CoreEntities

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
        case imageArticle = "image_url"
        case newsSite = "news_site"
        case publishDate = "published_at"
        case launches
        
    }
    let articleID: Int
    let articleTitle: String
    let newsSite: String
    let imageArticle: String
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


extension Article {
    func toDomainArticle() -> ItemArticle {
        
        var domainLaunches: [ItemLaunch] = []
        
        for launch in launches {
            let domainLaunch = launch.toDomainLaunch()
            domainLaunches.append(domainLaunch)
        }
        
        return .init(
            idArticle: articleID,
            titleArticle: articleTitle,
            newsSite: newsSite,
            articleImage: imageArticle,
            publishDate: publishDate,
            launches: domainLaunches
        )
    }
}

extension Launch {
    func toDomainLaunch() -> CoreEntities.ItemLaunch {
        return .init(
            launchID: launchID,
            provider: provider
        )
    }
}
