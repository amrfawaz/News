//
//  SearchNewsRequstParameters.swift
//  News
//
//  Created by AmrFawaz on 11/18/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Foundation
class SearchNewsRequstParameters: RequestParamters {
    let apiKey = Configurations.api_Key
    let pageSize = 20
    var page: Int?
    var q: String?

}
