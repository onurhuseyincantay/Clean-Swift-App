//
//  LandingViewController.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    // MARK: - ProviderTypes
    typealias Router = LandingRouter
    typealias ContainerView = LandingView
    typealias Interactor = LandingInteractor
    
    // MARK: - Variables
    internal var containerView = LandingView()
    internal var router: LandingRouter?
    internal var interactor: LandingInteractor?
    
    // MARK: - Object LifeCyle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - View Life Cycle
    override func loadView() {
        view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

// MARK: - VIPController
extension LandingViewController: VIPController {
    
    
    func handleState(_ state: PresentationState<LandingState, LandingError>) {
        switch state {
        case .value(let valueType):
            switch valueType {
            case .loginPressed:
                router?.push(with: .login)
            case .registerPressed:
                router?.push(with: .register)
            }
        case .error(let errorType):
            switch errorType {
            case .underlying(let error):
                print(error.localizedDescription)
            }
            
        case .idle:
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        case .loading:
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    func setup() {
        let viewController = self
        navigationItem.titleView?.tintColor = .white
        navigationItem.title = "Landing"
        router = LandingRouter(viewController: viewController)
        let presenter = LandingPresenter()
        presenter.stateHandler = handleState
        interactor = LandingInteractor(presenter: presenter)
        prepareLandingView()
    }
}

// MARK: - Private Extension
private extension LandingViewController {
   
    
    func prepareLandingView() {
        containerView.registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        containerView.loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        containerView.fakeNetworkCallButton.addTarget(self, action: #selector(fakePressed), for: .touchUpInside)
    }
    
    @objc func registerPressed(_ sender: UIButton) {
        interactor?.registerPressed()
    }
    
    @objc func loginPressed(_ sender: UIButton) {
        interactor?.loginPressed()
    }
    
    @objc func fakePressed(_ sender: UIButton) {
        interactor?.fakePressed()
    }
}

