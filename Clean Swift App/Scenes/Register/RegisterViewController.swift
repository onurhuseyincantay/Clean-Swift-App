//
//  RegisterViewController.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    typealias Router = RegisterRouter
    typealias Interactor = RegisterInteractor
    typealias ContainerView = RegisterView
    
    var containerView = RegisterView()
    var router: RegisterRouter?
    var interactor: RegisterInteractor?
    
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
        navigationItem.title = "Register"
        // Do any additional setup after loading the view.
    }
}

// MARK: - VIPController
extension RegisterViewController: VIPController {
    func handleState(_ state: PresentationState<RegisterState, RegisterError>) {
        
    }
    
    func setup() {
        let viewController = self
        navigationItem.title = "Register"
        navigationItem.titleView?.tintColor = .white
        router = RegisterRouter(viewController: viewController)
        let presenter = RegisterPresenter()
        presenter.stateHandler = { [weak self] state in
            self?.handleState(state)
        }
        interactor = RegisterInteractor(presenter: presenter)
    }
}
