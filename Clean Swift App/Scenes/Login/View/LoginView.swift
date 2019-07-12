//
//  LoginView.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import UIKit

class LoginView: UIView {
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.8)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .groupTableViewBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .groupTableViewBackground
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var inputStackView: UIStackView = {
        let stack = UIStackView(
            arrangedSubviews: [
                emailTextField,
                passwordTextField,
                loginButton
            ])
        stack.axis = .vertical
        stack.spacing = 12
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        roundCorners()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}

private extension LoginView {
    func setup() {
        addSubview(inputStackView)
        NSLayoutConstraint.activate(
            [
                inputStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                inputStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 16),
                inputStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75)
            ]
        )
        layoutIfNeeded()
    }
    
    func roundCorners() {
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
}
