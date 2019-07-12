//
//  LoginUserInteractorTests.swift
//  StandAppTests
//
//  Created by Onur Hüseyin Çantay on 19.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import XCTest
@testable import StandApp

class LoginUserInteractorTests: XCTestCase {
    typealias LoginPresentationState = PresentationState<LoginState,LoginError>
    
    var interactor: LoginInteractor!
    override func setUp() {
        let presenter = LoginPresenter()
        interactor = LoginInteractor(presenter: presenter)
    }
    
    override func tearDown() {
        interactor = nil
    }

    func testLoginUserWithoutValidData() {
        interactor.login(with: "", password: "")
        guard let presenter = interactor.presenter else { fatalError() }
        if case .error(.credentialError(.emailError(.isEmpty))) = presenter.currentState {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testLoginUserWithValidData() {
        interactor.login(with: "asdasdas@asdaasd.com", password: "AAAaaaa123124sad.")
        guard let presenter = interactor.presenter else { fatalError() }
        guard case .value(.loggedIn) = presenter.currentState else {
            XCTAssert(false)
            return
        }
        XCTAssert(true)
    }
    
    func testLoginUserWithNoLowerCasePassword() {
        interactor.login(with: "asdasdas∂@asdaasd.com", password: "ADKLJ1ALDKFA")
        guard let presenter = interactor.presenter else { fatalError() }
        if case .error(.credentialError(.passwordError(.lowerCasedCharachter))) = presenter.currentState {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testLoginUserWithNoUpperCasePassword() {
        interactor.login(with: "asdasdas@asdaasd.com", password: "ahagsdhjas123123")
        guard let presenter = interactor.presenter else { fatalError() }
        if case .error(.credentialError(.passwordError(.uppercasedCharachter))) = presenter.currentState {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testLoginUserPasswordNotLongEnough() {
        interactor.login(with: "asdasdas@asdaasd.com", password: "asdfajsdasd")
        guard let presenter = interactor.presenter else { fatalError() }
        if case .error(.credentialError(.passwordError(.digits))) = presenter.currentState {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
}
