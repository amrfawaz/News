
//
//  SearchNewsResponse.swift
//  News
//
//  Created by AmrFawaz on 11/18/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Foundation
import Foundation

class SearchNewsResponse: Codable {
    let articles: [News]?
    let totalResults: Int?
}
