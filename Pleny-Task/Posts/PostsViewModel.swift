//
//  PostsViewModel.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation
import Combine

class PostsViewModel : ObservableObject {
    var repo : PostsRepository
    @Published public var posts : [Post]
    var total : Int
    var skip : Int = 0
    @Published var isLoading = false
    @Published var query = ""
    init (repository :PostsRepository){
        repo = repository
        posts = []
        total = 0
        
        getPosts()
    }
    
    func addImages(currentItem items: [Post]) -> [Post]{
        
        for item in items {
            if (item.id ?? 0) % 2 == 0 {
                item.profileImage = "ProfileImage"
                item.images = ["foodimage6" , "foodimage7" , "foodimage8" , "foodimage9" , "foodimage9" , "foodimage9"]
            }else if (item.id ?? 0) % 3 == 0 {
                item.profileImage = "ProfileImage2"
                item.images = ["foodImage1" , "foodimage2" , "foodimage3"]
            }else{
                item.profileImage = "ProfileImage3"
                item.images = ["foodimage4"]
            }
        }
        
        return items
    }
    
    func loadMorePosts(currentItem item: Post){
        let postIndex = self.posts.index(self.posts.endIndex, offsetBy: -1)
        if postIndex == item.id, posts.count <= total {
               skip = posts.count
               getPosts()
           }
       }
    
    func getPosts(){
        isLoading = true
        repo.getPosts(query: query, skip: skip) { [weak self] result, error in
            guard let self = self else {return}
            isLoading = false
            if error == nil {
                dump(skip)
                if skip != 0{
                    self.posts.append(contentsOf: addImages(currentItem: result?.posts ?? []))
                }else{
                    self.posts = addImages(currentItem: result?.posts ?? [])
                }
                self.total = result?.total ?? 0
            }else{
                AlertMessage.alertError(error)
            }
        }
    }
}
