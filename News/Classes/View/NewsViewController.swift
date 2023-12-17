//
//  NewsViewController.swift
//  News
//
//  Created by Rene Lujano Laura on 17/12/23.
//

import Foundation
import UIKit

public class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
}

extension NewsViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        200
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = self.newsTableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as UITableViewCell
        return articleCell
    }
    
    
}

