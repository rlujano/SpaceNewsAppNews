//
//  ImageArticleTask.swift
//  News
//
//  Created by Rene Lujano Laura on 20/12/23.
//


import Foundation

struct ConnectionParametersImage {
    static func getURL(imageURL: String) -> String {
        return imageURL
    }
    
}

class ImageArticlesTask {
    
    static func doRequest(imageURL: String ,completion: @escaping (Result<UIImage?, Error>) -> Void) -> Void {
        
        let newURL = URL(string: ConnectionParametersImage.getURL(imageURL: imageURL))!
        
        let task = URLSession.shared.dataTask(with: newURL) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // Revisión para controlar catch
            do{
                let imageART = UIImage(data: data)
                if let imageArt = imageART {
                    DispatchQueue.main.async {
                        completion(.success(imageART))
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
