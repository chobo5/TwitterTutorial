//
//  MainTabController.swift
//  TwitterTutorial
//
//  Created by 원준연 on 2023/09/26.
//

import UIKit
import SnapKit

class MainTabController: UITabBarController {

    //MARK: - Properties
    //각 navigationController에 추가하는것이 아닌 탭바에 한번에 추가
    private let actionButton: RoundButton = {
        let button = RoundButton()
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(MainTabController.self, action: #selector(actionButtonTapped(sender:)), for: .touchUpInside)
        return button
    }()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(actionButton)
        // Do any additional setup after loading the view.
        setupUI()
        configureViewControllers()
    }

    //MARK: - Selectors
    @objc func actionButtonTapped(sender: RoundButton) {
        print("actionButtonTapped")
    }
    //MARK: - Helper
    
    func setupUI() {
        actionButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-56)
            make.trailing.equalToSuperview().offset(-16)
            make.width.height.equalTo(self.view.snp.width).multipliedBy(0.13)
        }
        
    }
    
    func configureViewControllers() {
        let feed = FeedController()
        let feedNav = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExploreController()
        let exploreNav = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationsController()
        let notificationsNav = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)
        
        let conversations = ConversationsController()
        let conversationsNav = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)
        
        viewControllers = [feedNav, exploreNav, notificationsNav, conversationsNav]
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }

}
