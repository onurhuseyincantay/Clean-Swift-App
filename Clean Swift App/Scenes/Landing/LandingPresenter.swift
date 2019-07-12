//
//  LandingPresenter.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation

enum LandingState {
    case loginPressed
    case registerPressed
}

enum LandingError: Error {
    case underlying(Error)
}

class LandingPresenter: Presentable {
    typealias ValueState = LandingState
    typealias ErrorState = LandingError
    
    var stateHandler: ((PresentationState<LandingState, LandingError>) -> Void)?
    
    var currentState: PresentationState<LandingState, LandingError> = .idle {
        didSet {
            stateHandler?(currentState)
        }
    }
}
