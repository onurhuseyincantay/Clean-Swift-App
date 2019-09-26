//
//  CleanSwiftSampleTests.swift
//  CleanSwiftSampleTests
//
//  Created by Onur Cantay on 26/09/2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//
import XCTest
@testable import CleanSwiftSample

class LoginUserInteractorTests: XCTestCase {
    typealias LoginPresentationState = PresentationState<LoginState,LoginError>
    
    var interactor: LoginInteractor!
    override func setUp() {
        let presenter = LoginPresenter()
        interactor = LoginInteractor()
        interactor.presenter = presenter
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
