//
//  PostsModel.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation

class PostsModel: Codable {
    let posts: [Post]
    let total, skip, limit: Int
}

// MARK: - Post
class Post: Codable , Identifiable {
    var id: Int?
    var title, body: String?
    var userID: Int?
    var tags: [String]?
    var reactions: Int?
    var images : [String]?
    var profileImage : String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, body
        case userID = "userId"
        case tags, reactions
    }
}
