//
//  PostsViewConfigurator.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation

final class PostsViewConfigurator {
    
    public static func configure() -> PostsView {
        let repo = PostsRepositoryImplementation()
        let viewModel: PostsViewModel = PostsViewModel(repository: repo)
        let view = PostsView(viewModel: viewModel)
        return view
    }
}
