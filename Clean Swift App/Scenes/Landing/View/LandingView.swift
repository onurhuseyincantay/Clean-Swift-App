//
//  LandingView.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import UIKit

class LandingView: UIView {
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.tintColor = UIColor.black.withAlphaComponent(0.7)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.tintColor = UIColor.black.withAlphaComponent(0.7)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var fakeNetworkCallButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Make Fake Network Call", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.tintColor = UIColor.black.withAlphaComponent(0.7)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
       let stack = UIStackView(
        arrangedSubviews: [
            self.loginButton,
            self.registerButton,
            self.fakeNetworkCallButton
        ])
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        roundCorners()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
        layoutIfNeeded()
    }
    
    func roundCorners() {
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        registerButton.layer.cornerRadius = registerButton.frame.height / 2
        fakeNetworkCallButton.layer.cornerRadius = fakeNetworkCallButton.frame.height / 2
    }
}
