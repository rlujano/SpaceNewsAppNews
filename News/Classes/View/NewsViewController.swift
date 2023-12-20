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
        
        articleCell.lblTitle.text = articlesViewModel?.articles?[indexPath.row].titleArticle
        
        articleCell.lblNewSite.text = articlesViewModel?.articles?[indexPath.row].newsSite
        
        let dateArticle = articlesViewModel?.articles?[indexPath.row].publishDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, y 'at' h:mm a, zzzz"

        let formattedDate = dateFormatter.string(from: Date())

        print("Formatted date: \(formattedDate)")
        articleCell.lblPublishedDate.text = formattedDate
        
        return articleCell
    }
    
}

extension NewsViewController: ArticlesViewModelDelegateProtocol {
    // Todo magic numbers
    func articlesEvent(state: ViewControllerState) {
        switch state {
            case .success:
                newsTableView.reloadData()
            case .loading:
                print("todo Loading")
            case .error:
                print("Todo error")
        }
    }
}

