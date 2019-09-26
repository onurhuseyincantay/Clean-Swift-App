//
//  Presentable.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation

protocol Presentable{
    typealias StateType = ((PresentationState<ValueState,ErrorState>) -> Void)?
    /// Value State
    associatedtype ValueState
    /// Error State
    associatedtype ErrorState: Error
    /// state handler completion block
    var stateHandler: StateType { get set }
    /// current state of the Presentable Object
    var currentState: PresentationState<ValueState,ErrorState> { get }
}
