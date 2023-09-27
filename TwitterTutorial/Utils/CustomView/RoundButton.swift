//
//  RoundView.swift
//  TwitterTutorial
//
//  Created by 원준연 on 2023/09/27.
//

import UIKit

class RoundButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width / 2
    }
}
