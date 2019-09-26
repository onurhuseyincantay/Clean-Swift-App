//
//  LandingRouter.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation
import UIKit.UIViewController

enum LandingDestination: DestionationType {
    case login
    case register
    
    var destinationViewController: UIViewController {
        switch self {
        case .login:
            return LoginViewController(router: LoginRouter(), interactor: LoginInteractor())
        case .register:
            return RegisterViewController(router: RegisterRouter(), interactor: RegisterInteractor())
        }
    }
}

class LandingRouter: Routeable {
    typealias Destination = LandingDestination
    
    var viewController: UIViewController?
    
    func present(with destination: LandingDestination) {
        viewController?.present(destination.destinationViewController, animated: true, completion: nil)
    }
    
    func show(with destination: LandingDestination) {
        viewController?.show(destination.destinationViewController, sender: nil)
    }
    
    func push(with destination: LandingDestination) {
        viewController?.navigationController?.pushViewController(destination.destinationViewController, animated: true)
    }
}
