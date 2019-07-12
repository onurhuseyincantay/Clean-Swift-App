//
//  Constants.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 19.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation

struct Constants {
    enum PredictionRegex {
        static var emailPredicate: NSPredicate {
            let emailFirstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
            let emailServerpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
            let emailRegex = emailFirstpart + "@" + emailServerpart + "[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegex)
        }
    }
    
    static var fullnamePredicate: NSPredicate {
        let fullnamePredicate = "^[\\p{L}'-][\\p{L}' -]{1,25}$"
        return NSPredicate(format: "SELF MATCHES %@", fullnamePredicate)
    }
}
