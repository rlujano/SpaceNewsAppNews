//
//  ArticleCell.swift
//  News
//
//  Created by Rene Lujano Laura on 19/12/23.
//

import UIKit
import CoreEntities
import CoreApp

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblNewSite: UILabel!
    @IBOutlet weak var lblPublishedDate: UILabel!
    
    @IBOutlet weak var imgArticle: UIImageView!
    
    
    var useCase: GetArticleImageUseCaseProtocol?
    var viewModel: ArticleImageViewModelProtocol?
    
    public var article: ItemArticle?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        useCase = GetArticleImageUseCase()
        if let useCase = useCase {
            viewModel = ArticleImageViewModel(useCase: useCase)
            viewModel?.delegate = self
        }
        
    }
    
    public func getImgArticle(article: ItemArticle?) {
        self.article = article
        if let imageURL = self.article?.articleImage{
            viewModel?.getImage(urlImage: imageURL)
            //viewModel?.delegate = self
        }
    }
    

    
}


extension ArticleCell: ArticleImageViewModelDelegateProtocol {
    func articleImageEvent(state: CoreApp.ViewControllerState) {
        self.imgArticle.image = viewModel?.articleImage
        
        print("¨¨¨¨")
        print(viewModel?.articleImage)
        print("____")
        /*switch state {
        case .success:
            //self.actIndCover.stopAnimating()
            self.imgArticle.image = viewModel?.articleImage
            //self.imgCover.image = viewModel?.coverImage
            print("success: \(article?.articleImage)")
        case .loading:
            print("Loading: \(article?.articleImage)")
            //self.actIndCover.startAnimating()
        case .error:
            print("Error")
        }*/
    }
    

}
