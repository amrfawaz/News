//
//  Storyboard.swift
//  News
//
//  Created by AmrFawaz on 11/18/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Foundation
struct StoryboardName {
    static let newsStoryboard = "News"
}

struct StoryboardIdentifire {
    // Search Storyboard
    static let searchNewsView = "SearchNewsViewController"
    static let newsDetailsView = "NewsDetailsViewController"
}

struct Storyboard {
    let name: String
    let identifire: String?
}

struct StoryboardMapper {
    struct Search {
        static let search = Storyboard(name: StoryboardName.newsStoryboard, identifire: StoryboardIdentifire.searchNewsView)
        static let newsDetails = Storyboard(name: StoryboardName.newsStoryboard, identifire: StoryboardIdentifire.newsDetailsView)
    }
}
