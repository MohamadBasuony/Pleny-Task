//
//  ErrorModel.swift
//  REFD-Customer
//
//  Created by Mohamad Basuony on 24/08/2023.
//

import Foundation
// For handling API Requests Errors
// MARK: - ErrorModel
class ErrorModel: Codable {
    var statusCode: Int?
    var message : [String]?
    var errors: [String]?
}
