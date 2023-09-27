//
//  InputContainerView.swift
//  TwitterTutorial
//
//  Created by 원준연 on 2023/09/27.
//

import UIKit
import SnapKit

class InputContainerView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(textField)
        self.addSubview(underLineView)
        setupView()
        
    }
    
    func setupView() {
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.width.equalTo(self.imageView.snp.height)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(5)
            make.top.trailing.bottom.equalToSuperview()
        }
        
        underLineView.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.leading)
            make.trailing.equalTo(textField.snp.trailing)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    func setAttributes(placeHolder: String?, image: UIImage?) {
        if let placeHolder = placeHolder {
            textField.placeholder = placeHolder
            textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
        
        if let image = image {
            imageView.image = image
        }
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
