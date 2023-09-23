//
//  LoginViewModel.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation
import Combine
import SwiftUI

class LoginViewModel : ObservableObject {
    @Published var model : LoginModel
    @Published var isLoading  = false
    var repository : AuthRepository
    var coordinator: LoginCoordinator?
    @Published var didLogin = false
    init(model : LoginModel , repository : AuthRepository, coordinator: LoginCoordinator) {
        self.model = model
        self.repository = repository
        self.coordinator = coordinator
    }
    
    
    lazy var nameValidation: ValidationPublisher = {
        return model.$username.isUserNameValidPublisher
    }()
    
    lazy var passwordValidation: ValidationPublisher = {
        model.$password.isUserLoginPasswordValidPublisher
    }()
    
    lazy var allFieldsValid: AnyPublisher<Bool , Never> = {
        Publishers.CombineLatest(
            nameValidation,
            passwordValidation
        ).map { v1, v2 in
            print("emailValidation: \(v1.isValid)")
            print("passwordValidation: \(v2.isValid)")
            return [v1, v2].allSatisfy { $0.isValid } ? true : false
        }.eraseToAnyPublisher()
    }()
    
    func login(){
        isLoading  = true
        repository.signIn(model: model) { [weak self] user, error in
            guard let self = self else {return}
            self.isLoading  = false
            if error == nil {
                UserDefaultsManager.apiToken = user?.token
                didLogin.toggle()
            }else{
                AlertMessage.alertError(error)
            }
        }
    }
    
    func goToPosts(route : LoginCoordinator.Route) -> PostsView?{
        
        guard let view = coordinator?.view(for: route) else {
            print("Cannot load next view")
            return nil
        }
        
        return view
    }
}
