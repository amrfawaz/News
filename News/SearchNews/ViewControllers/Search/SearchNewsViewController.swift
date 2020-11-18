//
//  SearchNewsViewController.swift
//  News
//
//  Created by AmrFawaz on 11/18/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import UIKit
import AlamofireImage

class SearchNewsViewController: BaseViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var newsTableView: UITableView!
    
    
    let viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        registerCells()
    }
    
    
    func registerCells() {
        newsTableView.register(UINib(nibName: String(describing: NewsListCell.self), bundle: nil), forCellReuseIdentifier: String(describing: NewsListCell.self))
    }
    
    func search() {
        // MARK: - Call search method on view model and handle it's callback
        hideLottieAnimation()
        showLoadingAnimation()
        viewModel.search(complition: { [weak self] error in
            guard let strongSelf = self else { return }
            if let error = error {
                strongSelf.hideLottieAnimation()
                strongSelf.showCustomAlert(title: error.title ?? "", message: error.message ?? "", doneButtonTitle: "Ok")
            } else {
                strongSelf.hideLottieAnimation()
                if let news = strongSelf.viewModel.articles, !news.isEmpty {
                    strongSelf.newsTableView.reloadData()
                } else {
                    strongSelf.newsTableView.reloadData()
                    strongSelf.showEmptyAnimation()
                }
            }
        })
    }

    @IBAction func buttonSearchDidPress(_ sender: Any) {
        if let text = searchBar.text, !text.isEmpty {
            viewModel.currentPage = 1
            viewModel.totalPages = 1
            viewModel.searchText = text
            search()
        }
    }
    
    
}
