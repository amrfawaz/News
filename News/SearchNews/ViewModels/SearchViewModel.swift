//
//  SearchViewModel.swift
//  News
//
//  Created by AmrFawaz on 11/18/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Foundation
class SearchViewModel {
    var articles: [News]?
    var currentPage = 1
    var totalPages = 1
    var searchText = ""
    
    func search(complition: @escaping (_ error: CustomError?) -> Void) {
        let parameters = SearchNewsRequstParameters()
        parameters.q = searchText
        parameters.page = currentPage
        let searchApi = SearchApi()
        searchApi.params = parameters
        searchApi.search().get { [weak self] response in
            guard let strongSelf = self else { return }
            if strongSelf.currentPage > 1 {
                strongSelf.articles?.append(contentsOf: response.articles ?? [])
            } else {
                strongSelf.articles = response.articles
                strongSelf.totalPages = (response.totalResults ?? 0) % 20
            }
            complition(nil)
        }.catch { error in
            complition(error as? CustomError)
        }
    }
}
