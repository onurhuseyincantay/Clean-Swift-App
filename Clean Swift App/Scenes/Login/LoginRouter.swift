//
//  LoginRouter.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation
import UIKit

enum LoginDestination: DestionationType {
    case main
    case credentialErrorAlert(CredentialError)
    
    var destinationViewController: UIViewController {
        switch self {
        case .main:
            return UIViewController()
            
        case .credentialErrorAlert(let error):
            let alert = UIAlertController(title: error.title, message: error.description, preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .destructive, handler: nil))
            return alert
        }
    }
}

class LoginRouter: Routeable {
    typealias Destination = LoginDestination
    
    var viewController: UIViewController?
}
