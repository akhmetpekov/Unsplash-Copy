//
//  ProfileView.swift
//  UnsplashApp
//
//  Created by Erik on 08.11.2023.
//

import UIKit

class ProfileView: UIViewController {
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var loginTextField: CustomTextField = {
        let tf = CustomTextField()
        tf.placeholder = "Email"
        return tf
    }()
    
    private lazy var passwordTextField: CustomTextField = {
        let tf = CustomTextField()
        tf.placeholder = "Password"
        return tf
    }()
    
    private lazy var loginButton: CustomButton = {
        let button = CustomButton()
        button.configuration?.title = "Log In"
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var signupButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Don't have an account? Join", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = Resources.Colors.background
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(signupButton)
    }
    
    private func makeConstraints() {
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(Resources.Constants.padding)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.padding)
            make.trailing.equalToSuperview().offset(-1 * Resources.Constants.padding)
            make.height.equalTo(30)
            make.width.equalTo(view.frame.width - CGFloat(Resources.Constants.padding * 2))
            make.top.equalTo(loginLabel.snp.bottom).offset(30)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.padding)
            make.trailing.equalToSuperview().offset(-1 * Resources.Constants.padding)
            make.height.equalTo(30)
            make.top.equalTo(loginTextField.snp.bottom).offset(30)
        }
        
        loginButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.padding)
            make.trailing.equalToSuperview().offset(-1 * Resources.Constants.padding)
            make.height.equalTo(40)
            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(15)
        }
        
        signupButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(15)
        }
    }
    
    @objc private func buttonPressed() {
        print("test")
    }
    
}

