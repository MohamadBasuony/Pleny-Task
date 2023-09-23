//
//  PostsRepository.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation
import Moya

protocol PostsRepository: AnyObject {
    
    func getPosts(query : String , skip : Int , completion: @escaping (PostsModel?,String?) -> Void)
}
class PostsRepositoryImplementation: PostsRepository{
    
    let accessToken = AccessTokenPlugin(tokenClosure: { _ -> String in
        return UserDefaultsManager.apiToken ?? ""
    })
    
    lazy var apiClient : MoyaProvider<PostsEndPoint> = MoyaProvider(handleRefreshToken: true , plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)),accessToken])
        
    func getPosts(query : String , skip : Int ,completion: @escaping (PostsModel?,String?) -> Void) {
        apiClient.request(.posts(query: query , skip: skip)) { result in
            switch result {
            case let .success(moyaResponse) :
                ResponseHandler.shared.handleResponse(moyaResponse: moyaResponse, model: PostsModel.self) { result, error in
                    completion(result , error)
                }
            case let .failure(error) :
                completion(nil, error.localizedDescription)
            }
        }
    }
}
