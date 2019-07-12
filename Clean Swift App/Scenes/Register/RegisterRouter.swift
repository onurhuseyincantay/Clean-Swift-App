//
//  RegisterRouter.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation
import UIKit

enum RegisterDestination: DestionationType {
    case main
    
    var destinationViewController: UIViewController {
        switch self {
        case .main:
            return UIViewController()
        }
    }
}

class RegisterRouter: Routeable {
    typealias Destination = RegisterDestination
    
    var viewController: UIViewController?
    
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
