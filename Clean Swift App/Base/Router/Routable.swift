//
//  Routable.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation
import UIKit

protocol Routeable {
    
    /// an enum which conforms to DestinationType
    associatedtype Destination: DestionationType
    
    /// viewController that is going to do the routing
    var viewController: UIViewController? { get }
    
    /// Presents a viewcontroller
    ///
    /// - Parameters:
    ///   - destination: destination viewController
    ///   - animated: animation type
    ///   - completion: completion blok
    func present(with destination: Destination, animated: Bool, completion: (() -> Void)?)
    
    /// Shows a viewController
    ///
    /// - Parameters:
    ///   - destination: destination viewController
    ///   - sender: any object that has to be passed trough
    func show(with destination: Destination, sender: Any?)
    
    /// pushes if possible from a naigationcontroller
    ///
    /// - Parameters:
    ///   - destination: destination viewController
    ///   - animated: animation type
    func push(with destination: Destination, animated: Bool)
    
    /// dismisses a viewController
    ///
    /// - Parameters:
    ///   - animated: animation Type
    ///   - completion: completion block
    func dismiss(animated: Bool, completion: (() -> Void)?)
    
    /// Pops a viewController if possible
    ///
    /// - Parameter animated: animation type
    func popViewController(animated: Bool)
}

extension Routeable {
    
    func present(with destination: Destination, animated: Bool, completion: (() -> Void)?) {
        viewController?.present(destination.destinationViewController, animated: animated, completion: completion)
    }
    
    func show(with destination: Destination, sender: Any?) {
        viewController?.show(destination.destinationViewController, sender: nil)
    }
    
    func push(with destination: Destination, animated: Bool) {
        viewController?.navigationController?.pushViewController(destination.destinationViewController, animated: animated)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {
        viewController?.dismiss(animated: animated, completion: completion)
        
    }
    func popViewController(animated: Bool) {
        viewController?.navigationController?.popViewController(animated: animated)
    }
    
}
