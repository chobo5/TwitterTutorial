//
//  File.swift
//  TwitterTutorial
//
//  Created by 원준연 on 2023/09/26.
//

import UIKit
import SnapKit

class LoginController: UIViewController {
    //MARK: - Properties
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "TwitterLogo")
        return imageView
    }()
    
    private let emailInputView: InputContainerView = {
        let view = InputContainerView()
        return view
    }()
    
    private let passwordInputView: InputContainerView = {
        let view = InputContainerView()
        return view
    }()
    
    private let signUpView: TextAndButtonView = {
       let view = TextAndButtonView()
        view.textLabel.text = "Don't have an account?"
        view.textButton.setTitle("Sign Up", for: .normal)
        view.textButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return view
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .white
        button.setTitleColor(.twitterBlue, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(logoImageView)
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(emailInputView)
        stackView.addArrangedSubview(passwordInputView)
        stackView.addArrangedSubview(loginButton)
        self.view.addSubview(signUpView)
        setupUI()
    }
    
    //MARK: - Selectors
    @objc private func loginButtonTapped() {
        print("loginButtonTapped")
    }
    
    @objc private func signUpButtonTapped() {
        let registraionVC = RegistrationController()
        self.navigationController?.pushViewController(registraionVC, animated: true)
    }
    
    
    //MARK: - Helpers
    func setupUI() {
        self.view.backgroundColor = .twitterBlue
        self.navigationController?.navigationBar.barStyle = .black //시계, 배터리가 흰색으로 변경됨
        
        //상단 트위터 로고
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(self.view.snp.width).multipliedBy(0.4)
        }
        
        //이메일, 비밀번호 입력 view
        stackView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalToSuperview().multipliedBy(0.225)
        }
        emailInputView.setAttributes(placeHolder: "Email", image: UIImage(named: "ic_mail_outline_white_2x-1"))
        passwordInputView.setAttributes(placeHolder: "Password", image: UIImage(named: "ic_lock_outline_white_2x"))
        passwordInputView.textField.isSecureTextEntry = true
        
        //signUp View
        signUpView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
        
        
    }
    
}
