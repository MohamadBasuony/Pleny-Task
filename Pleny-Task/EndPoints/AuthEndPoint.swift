//
//  AuthEndPoint.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation
import Alamofire
import Moya

enum AuthEndPoint {
    case login(model : LoginModel)

}

extension AuthEndPoint: TargetType {
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method {
        switch self {
        case .login: return .post
            
        default :
            return .get
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://dummyjson.com/auth")!
    }
    
    var path: String {
        switch self {
        case .login: return "/login"
        }
    }
    
    var headers: [String: String]? {
        ["Content-Type": "application/json",
         "Accept": "application/json"
        ]
    }
    
    var task: Task {
        switch self {
        case let .login(model) :
            return .requestJSONEncodable(model)

        default :
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
}

extension AuthEndPoint : AccessTokenAuthorizable {
    var authorizationType: Moya.AuthorizationType? {
        return .bearer
    }
}
