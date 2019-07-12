//
//  LandingInterector.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation


protocol Interactable {
    associatedtype Presenter: Presentable
    
    var presenter: Presenter? { get }
    
    init(presenter: Presenter)
}

class LandingInteractor: Interactable {
    typealias Presenter = LandingPresenter
    
    var presenter: LandingPresenter?
    
    required init(presenter: LandingPresenter) {
        self.presenter = presenter
    }
}

extension LandingInteractor {
    func loginPressed() {
        presenter?.currentState = .value(.loginPressed)
    }
    
    func registerPressed() {
        presenter?.currentState = .value(.registerPressed)
    }
    
    func fakePressed() {
        presenter?.currentState = .loading
        print("Started Loading")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            self?.presenter?.currentState = .idle
            print("Ended Loading after 3 seconds")
        }
    }
}
