//
//  LoginPresenter.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation

enum LoginState: Equatable {
    case loggedIn
}

enum LoginError: Error {
    case unauthorized
    case credentialError(CredentialError)
    case underlying(Error)
}



class LoginPresenter: Presentable {
    typealias ValueState = LoginState
    typealias ErrorState = LoginError
    
    var stateHandler: ((PresentationState<LoginState, LoginError>) -> Void)?
    
    var currentState: PresentationState<LoginState, LoginError> = .idle {
        didSet {
            stateHandler?(currentState)
        }
    }
}
