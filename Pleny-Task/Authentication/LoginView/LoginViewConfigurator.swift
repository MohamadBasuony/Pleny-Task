//
//  LoginViewConfigurator.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation

final class loginConfigurator {
    
    public static func configure() -> LoginView {
        let repo = AuthRepositoryImplementation()
        let coordinator = LoginCoordinator()
        let viewModel: LoginViewModel = LoginViewModel(model: LoginModel(), repository: repo,coordinator: coordinator)
        let view = LoginView(viewModel: viewModel)
        return view
    }
}
