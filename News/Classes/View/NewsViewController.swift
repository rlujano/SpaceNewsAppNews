//
//  NewsViewController.swift
//  News
//
//  Created by Rene Lujano Laura on 17/12/23.
//

import Foundation
import UIKit

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
        let articleCell = self.newsTableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as UITableViewCell
        articleCell.textLabel?.text = articlesViewModel?.articles?[indexPath.row].titleArticle
        return articleCell
    }
    
}

extension NewsViewController: ArticlesViewModelDelegateProtocol {
    // Todo magic numbers
    func articlesEvent(state: Int) {
        switch state {
            case 1:
                newsTableView.reloadData()
            default:
                print("No action")
        }
    }
}

