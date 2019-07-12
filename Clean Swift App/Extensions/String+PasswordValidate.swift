//
//  String+PasswordValidate.swift
//  Clean Swift App
//
//  Created by Onur Hüseyin Çantay on 19.06.2019.
//  Copyright © 2019 Onur Hüseyin Çantay. All rights reserved.
//

import Foundation
extension String {
    var lengtIsMoreThanEight: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).count > 7
    }
    
    var hasDigits: Bool {
        let digitChars = CharacterSet.decimalDigits
        return self.rangeOfCharacter(from: digitChars) != nil
    }
    
    var hasUpperCase: Bool {
        let uppercaseChars = CharacterSet.uppercaseLetters
        return self.rangeOfCharacter(from: uppercaseChars) != nil
    }
    
    var hasLowerCase: Bool {
        let lowercaseChars = CharacterSet.lowercaseLetters
        return self.rangeOfCharacter(from: lowercaseChars) != nil
    }
}
