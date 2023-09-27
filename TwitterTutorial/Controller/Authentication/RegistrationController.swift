//
//  File2.swift
//  TwitterTutorial
//
//  Created by 원준연 on 2023/09/26.
//

import UIKit
import SnapKit

class RegistrationController: UIViewController {
    //MARK: - Properties
    lazy var addPhotoButton: RoundButton = {
        let button = RoundButton()
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(addPhotoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let emailInputView = InputContainerView()
    
    private let passwordInputView = InputContainerView()
    
    private let fullNameInputView = InputContainerView()
    
    private let userNameInputView = InputContainerView()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .white
        button.setTitleColor(.twitterBlue, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let logInView: TextAndButtonView = {
        let view = TextAndButtonView()
        view.textLabel.text = "Already have an account?"
        view.textButton.setTitle("Log In", for: .normal)
        view.textButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return view
    }()
    
    private let imagePicker = UIImagePickerController()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .twitterBlue
        self.view.addSubview(addPhotoButton)
        self.view.addSubview(stackView)
        self.view.addSubview(logInView)
        stackView.addArrangedSubview(emailInputView)
        stackView.addArrangedSubview(passwordInputView)
        stackView.addArrangedSubview(fullNameInputView)
        stackView.addArrangedSubview(userNameInputView)
        stackView.addArrangedSubview(signUpButton)
        setupUI()
    }
    
    //MARK: - Selectors
    @objc private func addPhotoButtonTapped() {
        print("addPhotoButtonTapped")
        present(imagePicker, animated: true)
    }
    
    @objc private func signUpButtonTapped() {
        print("signUpButtonTapped")
    }
    
    @objc private func logInButtonTapped() {
        print("logInButtonTapped")
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helpers
    private func setupUI() {
        
        addPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(self.view.snp.width).multipliedBy(0.35)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(addPhotoButton.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalToSuperview().multipliedBy(0.375)
        }
        
        //signUp View
        logInView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
        emailInputView.setAttributes(placeHolder: "Email", image: UIImage(named: "ic_mail_outline_white_2x-1"))
        passwordInputView.setAttributes(placeHolder: "Password", image: UIImage(named: "ic_lock_outline_white_2x"))
        fullNameInputView.setAttributes(placeHolder: "Full Name", image: UIImage(named: "ic_person_outline_white_2x"))
        userNameInputView.setAttributes(placeHolder: "Username", image: UIImage(named: "ic_person_outline_white_2x"))
        
        imagePicker.delegate = self
    }
}

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
