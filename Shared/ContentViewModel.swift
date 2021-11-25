//
//  ContentViewModel.swift
//  Edvora (iOS)
//
//  Created by  on 24/11/21.
//

import Foundation
class ContentViewModel: ObservableObject {
    
    var email = ""
    var username = ""
    var password = ""
    var errorMessage = ""
    
    init() {
        
    }
    
    func isValidData() -> Bool {
        if !isValidUsername() {
            errorMessage = "Please provide username which should not have spaces and no upper case alphabet."
            return false
        }
        if !isValidPassword() {
            errorMessage = "Please provide password which should have 8 characters, 1 number, 1 upper case alphabet, 1 lower case alphabet."
            return false
        }
        if !isValidEmail() {
            errorMessage = "Please provide proper email."
            return false
        }
        return true
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isValidUsername() -> Bool {
        if username.isEmpty || username.contains(" "){
            return false
        }
        let upperCaseRange = username.rangeOfCharacter(from: CharacterSet.uppercaseLetters)
        if upperCaseRange != nil {
            print("uppercase found")
            return false
        }
        return true
    }
    func isValidPassword() -> Bool {
        if password.count < 8 {
            return false
        }
       
        let decimalRange = password.rangeOfCharacter(from: CharacterSet.decimalDigits)
        if decimalRange != nil {
            print("Numbers found")
        }else{
            return false
        }
        
        let upperCaseRange = password.rangeOfCharacter(from: CharacterSet.uppercaseLetters)
        if upperCaseRange != nil {
            print("uppercase found")
        }else{
            return false
        }
        
        let lowerCaseRange = password.rangeOfCharacter(from: CharacterSet.lowercaseLetters)
        if lowerCaseRange != nil {
            print("lowercase found")
        }else{
            return false
        }
        return true
    }
}
