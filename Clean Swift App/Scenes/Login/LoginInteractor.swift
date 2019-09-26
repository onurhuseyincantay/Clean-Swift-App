//
//  LoginInteractor.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation
class LoginInteractor: Interactable {
    typealias Presenter = LoginPresenter
    
    var presenter: LoginPresenter?
}

extension LoginInteractor {
    func login(with email: String?, password: String?) {
       
        guard let email = email, !email.isEmpty else {
            presenter?.currentState = .error(.credentialError(.emailError(.isEmpty)))
            return
        }
        guard let password = password, !password.isEmpty else {
            presenter?.currentState = .error(.credentialError(.passwordError(.isEmpty)))
            return
        }
        
        // TODO: - this should move into a validator class
        if !password.lengtIsMoreThanEight {
            presenter?.currentState = .error(.credentialError(.passwordError(.moreThanEightCharacters)))
            return
        } else if !password.hasDigits {
            presenter?.currentState = .error(.credentialError(.passwordError(.digits)))
            return
        } else if !password.hasLowerCase {
            presenter?.currentState = .error(.credentialError(.passwordError(.lowerCasedCharachter)))
            return
        } else if !password.hasUpperCase {
            presenter?.currentState = .error(.credentialError(.passwordError(.uppercasedCharachter)))
            return
        }
        
        guard Constants.PredictionRegex.emailPredicate.evaluate(with: email) else {
            presenter?.currentState = .error(.credentialError(.emailError(.invalidEmail)))
            return
        }
        
        print("Email: ",email)
        
        print("Password: ",password)

        presenter?.currentState = .value(.loggedIn)
    }
}
