//
//  Login<odel.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation

class LoginModel : Codable ,ObservableObject {
    
    @Published var username : String = ""
    @Published var password : String = ""
}
