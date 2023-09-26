//
//  ConversationsController.swift
//  TwitterTutorial
//
//  Created by 원준연 on 2023/09/26.
//

import UIKit

class ConversationsController: UIViewController {

    //MARK: - Properties
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //MARK: - Helper
    
    func setupUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Messages"
    }

}
