//
//  PresentationState.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

/// View PresentationState
///
/// - idle: idle state of the view
/// - loading: loading state of the view
/// - value: actual value changes of the view
/// - error: error state of the view
enum PresentationState<T,U: Error> {
    case idle
    case loading
    case value(T)
    case error(U)
}


extension PresentationState: Equatable where T: Equatable, U: Equatable { }
