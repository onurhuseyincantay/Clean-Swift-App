//
//  RegisterInteractor.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 18.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation

class RegisterInteractor: Interactable {
    typealias Presenter = RegisterPresenter
    
    var presenter: RegisterPresenter?
    
    required init(presenter: RegisterPresenter) {
        self.presenter = presenter
    }
    
}
