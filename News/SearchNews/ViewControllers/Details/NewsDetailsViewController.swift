//
//  NewsDetailsViewController.swift
//  News
//
//  Created by AmrFawaz on 11/18/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import UIKit
import AlamofireImage

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    @IBOutlet weak var labelAuther: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var buttonSource: UIButton!
    
    var article: News?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageUrl = article?.urlToImage, !imageUrl.isEmpty {
            newsImageView.af_setImage(withURL: URL(string: imageUrl)!, placeholderImage: UIImage(named: "placeholder"))
        }
        labelTitle.text = article?.title
        labelDescription.text = article?.description
        labelContent.text = article?.content
        labelAuther.text = "By: \(article?.author ?? "")"
        labelDate.text = article?.publishedAt
        buttonSource.isHidden = article?.url?.isEmpty ?? true
    }
    

    @IBAction func buttonSourceDidPressed(_ sender: Any) {
        if let url = URL(string: article?.url ?? "") {
            UIApplication.shared.open(url)
        }
    }
}
