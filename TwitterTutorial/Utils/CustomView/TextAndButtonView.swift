//
//  TextAndButtonView.swift
//  TwitterTutorial
//
//  Created by 원준연 on 2023/09/27.
//

import UIKit
import SnapKit

class TextAndButtonView: UIStackView {
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    let textButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addArrangedSubview(textLabel)
        self.addArrangedSubview(textButton)
        setupUI()
    }
    
    
    
    func setupUI() {
        self.axis = .horizontal
        self.spacing = 5
        self.distribution = .fillProportionally
        textLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
        }
        
        textButton.snp.makeConstraints { make in
            make.leading.equalTo(textLabel.snp.trailing).offset(5)
            make.top.bottom.equalToSuperview()
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
