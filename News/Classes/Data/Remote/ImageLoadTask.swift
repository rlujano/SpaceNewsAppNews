//
//  ImageLoadTask.swift
//  News
//
//  Created by Rene Lujano Laura on 21/12/23.
//

import Foundation
import UIKit

class ImageLoadTask {
    
    public func getArtImage(from urlString: String, completion: @escaping (UIImage?) -> Void ){
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                completion(UIImage(data: data))
            } else {
                completion(nil)
            }
            
        }.resume()
    }
    
}



