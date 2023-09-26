//
//  FeedController.swift
//  TwitterTutorial
//
//  Created by 원준연 on 2023/09/26.
//

import UIKit

class FeedController: UIViewController {

    //MARK: - Properties
    let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "twitter_logo_blue")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }

    //MARK: - Helper
    
    func setupUI() {
        self.view.backgroundColor = .white
        navigationItem.titleView = titleImageView
        
    }

}

