//
//  VIPController.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation
import UIKit

protocol VIPController: UIViewController  {
    associatedtype Router: Routeable
    associatedtype Interactor: Interactable
    associatedtype ContainerView: UIView
    
    /// View that has to be presented on ViewController
    var containerView: ContainerView { get }
    
    /// Router Class that is going to route the ViewController
    var router: Router { get }
    
    /// Interactor which handles the interaction
    var interactor: Interactor { get }
    
    
    /// Initializes the viewController with Provided Router and Interactor Classes
    /// - Parameter router: Routable
    /// - Parameter interactor: Interactable
    init(router: Router, interactor: Interactor)
    
    /// State Handler fucntion which will handle presenters state
    ///
    /// - Parameter state: PresentationState<Interactor.Presenter.ValueState,Interactor.Presenter.ErrorState>
    func handleState(_ state: PresentationState<Interactor.Presenter.ValueState,Interactor.Presenter.ErrorState>)
}

