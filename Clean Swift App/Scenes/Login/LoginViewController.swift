//
//  LoginViewController.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    typealias Router = LoginRouter
    typealias Interactor = LoginInteractor
    typealias ContainerView = LoginView
    
    internal var containerView = LoginView()
    internal var router: LoginRouter?
    internal var interactor: LoginInteractor?
    
    // MARK: - Object LifeCyle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
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
        interactor?.login(
            with: containerView.emailTextField.text,
            password: containerView.passwordTextField.text
        )
    }
}

// MARK: - VIPController
extension LoginViewController: VIPController {
    func handleState(_ state: PresentationState<LoginState, LoginError>) {
        switch state {
        case .value(let valueType):
            switch valueType {
            case .loggedIn:
                router?.popViewController(animated: true)
            }
        case .error(let errorType):
            switch errorType {
            case .unauthorized:
                print("User Unauthorized")
            case .underlying(let error):
                print(error.localizedDescription)
            case .credentialError(let credentialError):
                router?.present(with: .credentialErrorAlert(credentialError), animated: true, completion: nil)
            }
        case .idle:
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        case .loading:
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    func setup() {
        let viewController = self
        navigationItem.title = "Login"
        navigationItem.titleView?.tintColor = .white
        router = LoginRouter(viewController: viewController)
        let presenter = LoginPresenter()
        presenter.stateHandler = handleState
        prepareLoginContainer()
        interactor = LoginInteractor(presenter: presenter)
    }
}
