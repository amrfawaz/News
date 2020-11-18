//
//  SearchNewsViewController+Extension.swift
//  News
//
//  Created by AmrFawaz on 11/18/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Foundation
import UIKit
extension SearchNewsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = viewModel.articles?[indexPath.row]
        let articleCell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsListCell.self)) as? NewsListCell
        
        if let imageUrl = article?.urlToImage, !imageUrl.isEmpty {
            articleCell?.newsImageView.af_setImage(withURL: URL(string: imageUrl)!, placeholderImage: UIImage(named: "placeholder"))
        }
        articleCell?.labelNewsTitle.text = article?.title
        return articleCell!
    }
    
    // MARK: - Paganation implemantation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let articles = viewModel.articles, !articles.isEmpty else { return }
        
        if indexPath.row == (articles.count - 1), viewModel.currentPage <= (viewModel.totalPages) {
            viewModel.currentPage += 1
            search()
        }
    }
}

extension SearchNewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.articles?[indexPath.row]
        
        let newsDetailsViewController = Router.getDestinationViewController(storyboard: StoryboardMapper.Search.newsDetails) as? NewsDetailsViewController
        newsDetailsViewController?.article = article
        Router.navigate(destination: newsDetailsViewController!, presentationType: .push)

    }
}
