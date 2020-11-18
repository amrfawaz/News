//
//  SearchApi.swift
//  News
//
//  Created by AmrFawaz on 11/18/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Alamofire
import PromiseKit

class SearchApi: Api {
    enum APIRouter: Requestable {
        case search(SearchApi)

        var versoin: String? {
            return "/v2"
        }

        var path: String {
            switch self {
            case .search:
                return "/everything"
            }
        }

        var baseUrl: URL {
            return Configurations.rootUrl
        }

        var method: HTTPMethod {
            switch self {
            case .search:
                return .get
            }
        }

        var parameters: Parameters? {
            switch self {
            case let .search(api):
                return api.params?.getParamsAsJson()
            }
        }
    }
}

extension SearchApi {
    func search() -> Promise<SearchNewsResponse> {
        return fireRequestWithSingleResponse(requestable: APIRouter.search(self))
    }
}
