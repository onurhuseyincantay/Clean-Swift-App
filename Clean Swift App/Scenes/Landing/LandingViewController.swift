//
//  LandingViewController.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController, VIPController {
    // MARK: - ProviderTypes
    typealias Router = LandingRouter
    typealias ContainerView = LandingView
    typealias Interactor = LandingInteractor
    
    // MARK: - Variables
    internal var containerView = LandingView()
    var router: LandingRouter
    var interactor: LandingInteractor
    
   
    required init(router: LandingRouter, interactor: LandingInteractor) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        
        let presenter = LandingPresenter()
        presenter.stateHandler = { [weak self] state in
            self?.handleState(state)
        }
        presenter.stateHandler = handleState(_:)
        self.router.viewController = self
        self.interactor.presenter = presenter
        navigationItem.titleView?.tintColor = .white
        navigationItem.title = "Landing"
        prepareLandingView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle
    override func loadView() {
        view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func handleState(_ state: PresentationState<LandingState, LandingError>) {
        switch state {
        case .value(let valueType):
            switch valueType {
            case .loginPressed:
                router.push(with: .login)
            case .registerPressed:
                router.push(with: .register)
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
    
}

// MARK: - Private Extension
private extension LandingViewController {
   
    
    func prepareLandingView() {
        containerView.registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        containerView.loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        containerView.fakeNetworkCallButton.addTarget(self, action: #selector(fakePressed), for: .touchUpInside)
    }
    
    @objc func registerPressed(_ sender: UIButton) {
        interactor.registerPressed()
    }
    
    @objc func loginPressed(_ sender: UIButton) {
        interactor.loginPressed()
    }
    
    @objc func fakePressed(_ sender: UIButton) {
        interactor.fakePressed()
    }
}

