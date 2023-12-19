
import Foundation

struct ConnectionParameters {
    static let endpoint = "https://api.spaceflightnewsapi.net/v4/articles/"
}

class ArticlesTask {
    static func doRequest(completion: @escaping (Result<ArticlesResponseDTO, Error>) -> Void) -> Void {
        
        let url = URL(string: ConnectionParameters.endpoint)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                do {
                    let responseDTO = try JSONDecoder().decode(ArticlesResponseDTO.self, from: data)
                    //print(responseDTO)
                    completion(.success(responseDTO))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
