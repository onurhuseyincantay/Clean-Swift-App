//
//  LoginViewController.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, VIPController {
    typealias Router = LoginRouter
    typealias Interactor = LoginInteractor
    typealias ContainerView = LoginView
    
    internal var containerView = LoginView()
    internal var router: LoginRouter
    internal var interactor: LoginInteractor
    
    // MARK: - Object LifeCyle
    required init(router: LoginRouter, interactor: LoginInteractor) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        let presenter = LoginPresenter()
        presenter.stateHandler = { [weak self] state in
            self?.handleState(state)
        }
        self.interactor.presenter = presenter
        self.router.viewController = self
        prepareLoginContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func prepareLoginContainer() {
        containerView.loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        
    }
    
    @objc private func loginPressed(_ sender: UIButton) {
        interactor.login(
            with: containerView.emailTextField.text,
            password: containerView.passwordTextField.text
        )
    }
}

// MARK: - VIPController
extension LoginViewController {
    func handleState(_ state: PresentationState<LoginState, LoginError>) {
        switch state {
        case .value(let valueType):
            switch valueType {
            case .loggedIn:
                router.popViewController(animated: true)
            }
        case .error(let errorType):
            switch errorType {
            case .unauthorized:
                print("User Unauthorized")
            case .underlying(let error):
                print(error.localizedDescription)
            case .credentialError(let credentialError):
                router.present(with: .credentialErrorAlert(credentialError), animated: true, completion: nil)
            }
        case .idle:
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        case .loading:
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
}
