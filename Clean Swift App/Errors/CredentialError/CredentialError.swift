//
//  CredentialError.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 19.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation

enum CredentialError: Error {
    case emailError(EmailError)
    case passwordError(PasswordError)
    
    var title: String {
        switch self {
        case .emailError(let error):
            return error.title
        case .passwordError(let error):
            return error.title
        }
    }
    
    var description: String {
        switch self {
        case .emailError(let error):
            return error.description
        case .passwordError(let error):
            return error.description
        }
    }
}

enum EmailError: Error {
    case isEmpty
    case invalidEmail
    
    var title: String {
        switch self {
        case .isEmpty:
            return "Email cannot be blank"
        case .invalidEmail:
            return "Invalid Email"
        }
    }
    var description: String {
        switch self {
        case .isEmpty:
            return "Email can't be blank please fill the email field"
        case .invalidEmail:
            return "Given email is not in a good format"
        }
    }
}

enum PasswordError: Error {
    case isEmpty
    case uppercasedCharachter
    case lowerCasedCharachter
    case moreThanEightCharacters
    case digits
    
    var title: String {
        switch self {
        case .isEmpty:
            return "Password cannot be blank"
        case .lowerCasedCharachter,
             .uppercasedCharachter,
             .moreThanEightCharacters,
             .digits:
            return "Missing Recuirements"
        }
    }
    
    var description: String {
        switch self {
        case .isEmpty:
            return "Password can't be blank please fill the password field"
        case .lowerCasedCharachter:
            return "Password should contain minimum 1 lower cased charachter."
        case .uppercasedCharachter:
            return "Password should contain minimum 1 upper cased charachter."
        case .moreThanEightCharacters:
            return "Password should contain minimum 8 charachters."
        case .digits:
            return "Password should contain digits."
        }
    }
}
