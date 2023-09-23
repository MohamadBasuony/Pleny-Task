//
//  LoginCoordinator.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation
import SwiftUI

class LoginCoordinator {

    enum Route {
        case posts
    }
    
    private var postsViewModel: PostsViewModel!
    
    private func postsView() -> PostsView {
        return PostsViewConfigurator.configure()
    }


    func view(for route: Route) -> PostsView {
        switch route {

        case .posts:
            return postsView()
        }
    }
}
