//
//  NewsViewController.swift
//  News
//
//  Created by Rene Lujano Laura on 17/12/23.
//

import Foundation
import UIKit
import CoreApp

public class NewsViewController: UIViewController {
    
    var articlesViewModel: ArticlesViewModelProtocol?
    
    @IBOutlet weak var newsTableView: UITableView!
    
    @IBOutlet weak var actIndFetchData: UIActivityIndicatorView!
    public override func viewDidLoad() {
        let dataSource = ArticlesRemoteDataSource()
        let repository = RemoteArticleRepository(dataSource: dataSource)
        let useCase = ArticlesListingUseCase(articlesRepository: repository)
        articlesViewModel = ArticlesViewModel(useCase: useCase)
        articlesViewModel?.delegate = self
        articlesViewModel?.requestList()
    }
    
}

extension NewsViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articlesViewModel?.articles?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = self.newsTableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        
        articleCell.imgArticle.layer.cornerRadius = 10
        
        let artIMG = articlesViewModel?.articles?[indexPath.row].articleImage
        let loadTask = ImageLoadTask()
        loadTask.getArtImage(from: artIMG!) { image in
            DispatchQueue.main.async {
                articleCell.imgArticle.image = image
            }
        }
        
        articleCell.lblTitle.text = articlesViewModel?.articles?[indexPath.row].titleArticle
        
        articleCell.lblNewSite.text = articlesViewModel?.articles?[indexPath.row].newsSite
        let date = articlesViewModel?.articles?[indexPath.row].publishDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = Locale(identifier: "en_US")
        let convertedDate = dateFormatter.date(from: date ?? "")!
        
        dateFormatter.dateFormat = "MMMM d, yyyy 'at' HH:mm"
        dateFormatter.timeZone = NSTimeZone(name: "GMT-5") as TimeZone?
        dateFormatter.locale = Locale(identifier: "en_PE")
        let newDate = dateFormatter.string(from: convertedDate)
        articleCell.lblPublishedDate.text = newDate
        
        
        return articleCell
    }
    
}

extension NewsViewController: ArticlesViewModelDelegateProtocol {
    // Todo magic numbers
    func articlesEvent(state: ViewControllerState) {
        switch state {
            case .success:
            actIndFetchData.stopAnimating()
                newsTableView.reloadData()
            case .loading:
                actIndFetchData.startAnimating()
            case .error:
                actIndFetchData.stopAnimating()
                
        }
    }
}

