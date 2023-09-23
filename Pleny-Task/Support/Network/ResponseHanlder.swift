//
//  ResponseHanlder.swift
//  REFD-Customer
//
//  Created by Mohamad Basuony on 24/08/2023.
//

import Foundation
import Alamofire
import Moya

class ResponseHandler {
    
    static let shared = ResponseHandler()
    private init (){}
    
    func handleResponse<T : Codable>(moyaResponse : Response , model : T.Type ,completion: @escaping (T?,String?) -> Void){
        
        if moyaResponse.statusCode != 200 && moyaResponse.statusCode != 201 {
            do {
                let result = try moyaResponse.map(ErrorModel.self)
                let message = result.errors?.first ?? result.message?.first ?? ""
                completion(nil , message)
            }catch{ error
                completion(nil, error.localizedDescription)
            }
        }else{
            do {
                let result = try moyaResponse.map(model.self)
                completion(result , nil)
            }catch{ error
                completion(nil, error.localizedDescription)
            }
        }
    }
}
