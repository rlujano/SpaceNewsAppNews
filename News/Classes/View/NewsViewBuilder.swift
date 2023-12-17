//
//  NewsViewBuilder.swift
//  News
//
//  Created by Rene Lujano Laura on 17/12/23.
//

import UIKit

public class NewsViewBuilder {
    public static func getFirstView() -> UIViewController? {
        let moduleBundle = Bundle(for: NewsViewBuilder.self)
        guard let newsViewController = UIStoryboard.init(name: "News", bundle: moduleBundle).instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController else { return nil }
        return newsViewController
    }
}
