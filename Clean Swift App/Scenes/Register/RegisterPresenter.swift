//
//  RegisterPresenter.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation
enum RegisterState {
    case registered
}
enum RegisterError: Error {
    case invalidCredentials
}

class RegisterPresenter: Presentable {
    typealias ValueState = RegisterState
    typealias ErrorState = RegisterError
    
    var stateHandler: ((PresentationState<RegisterState, RegisterError>) -> Void)?
    
    var currentState: PresentationState<RegisterState, RegisterError> = .idle {
        didSet {
            stateHandler?(currentState)
        }
    }
    
}
