//
//  RegisterViewController.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, VIPController {
   
    typealias Router = RegisterRouter
    typealias Interactor = RegisterInteractor
    typealias ContainerView = RegisterView
    
    var containerView = RegisterView()
    var router: RegisterRouter
    var interactor: RegisterInteractor
    
    // MARK: - Object LifeCyle
    required init(router: RegisterRouter, interactor: RegisterInteractor) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        let presenter = RegisterPresenter()
        presenter.stateHandler = { [weak self] state in
            self?.handleState(state)
        }
        self.router.viewController = self
        self.interactor.presenter = presenter
        navigationItem.title = "Register"
        navigationItem.titleView?.tintColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Register"
    }
}

// MARK: - VIPController
extension RegisterViewController {
    func handleState(_ state: PresentationState<RegisterState, RegisterError>) {
        
    }
}
