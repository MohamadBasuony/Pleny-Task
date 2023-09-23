//
//  ValidationManager.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation
import Combine

typealias ValidationPublisher = AnyPublisher<ValidationModel, Never>

class ValidationManager {
    
    // Validates whether a string property is non-empty.
    static func nonEmptyValidation(for value :String) -> Bool {
        guard value.count > 0 else {
            return false
        }
        return true
    }
    
    // Validates whether a string property is matching a validation predicate
    static func matcherValidation(for value :String,
                                  withPattern pattern: NSPredicate) -> Bool {
        
        guard pattern.evaluate(with: value) else {
            return false
        }
        return true
    }
    
    // Validates whether a string property is containing acceptable minimum number of characters
    static func minimumCountValidation(for value : String,
                                       count : Int) -> Bool {
        guard value.count < count else {
            return false
        }
        return true
    }
}

extension Published.Publisher where Value == String {
    
    // Creates a publisher to update textfield
    var isUserNameValidPublisher: AnyPublisher<ValidationModel, Never> {
        let model = ValidationModel()
        return self.map { email in
            if !ValidationManager.nonEmptyValidation(for: email) {
                model.isValid = false
                model.message = Constants.requiredMessage
                return model
            }else {
                model.isValid = true
                model.message = ""
                return model
            }
        }
        .dropFirst()
        .eraseToAnyPublisher()
    }
    
    var isUserLoginPasswordValidPublisher: AnyPublisher<ValidationModel, Never> {
        let model = ValidationModel()
        return self.map { password in
            if !ValidationManager.nonEmptyValidation(for: password) {
                model.isValid = false
                model.message = Constants.requiredMessage
                return model
            }else {
                model.isValid = true
                model.message = ""
                return model
            }
        }
        .dropFirst()
        .eraseToAnyPublisher()
    }
}


