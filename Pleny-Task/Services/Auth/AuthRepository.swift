//
//  AuthService.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation
import Moya

protocol AuthRepository: AnyObject {
    
    func signIn(model : LoginModel , completion: @escaping (UserDataModel?,String?) -> Void)
}
class AuthRepositoryImplementation: AuthRepository{
    
    let accessToken = AccessTokenPlugin(tokenClosure: { _ -> String in
        return UserDefaultsManager.apiToken ?? ""
    })
    
    lazy var apiClient : MoyaProvider<AuthEndPoint> = MoyaProvider(handleRefreshToken: true , plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)),accessToken])
        
    func signIn(model : LoginModel ,completion: @escaping (UserDataModel?,String?) -> Void) {
        apiClient.request(.login(model: model)) { result in
            switch result {
            case let .success(moyaResponse) :
                ResponseHandler.shared.handleResponse(moyaResponse: moyaResponse, model: UserDataModel.self) { result, error in
                    completion(result , error)
                }
            case let .failure(error) :
                completion(nil, error.localizedDescription)
            }
        }
    }
    
}
