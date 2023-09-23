//
//  PostsEndPoint.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation
import Alamofire
import Moya

enum PostsEndPoint {
    case posts(query : String , skip : Int)
}

extension PostsEndPoint: TargetType {
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method {
        switch self {
        case .posts: return .get
            
        default :
            return .get
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://dummyjson.com")!
    }
    
    var path: String {
        switch self {
        case .posts: return "/posts"
        }
    }
    
    var headers: [String: String]? {
        ["Content-Type": "application/json",
         "Accept": "application/json"
        ]
    }
    
    var task: Task {
        switch self {
        case let .posts(query , skip) :
            return .requestParameters(parameters: ["q":query,
                                                   "limit":"10",
                                                   "skip":skip
                                                  ], encoding: URLEncoding.queryString)
            
        default :
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
}

extension PostsEndPoint : AccessTokenAuthorizable {
    var authorizationType: Moya.AuthorizationType? {
        return .bearer
    }
}
