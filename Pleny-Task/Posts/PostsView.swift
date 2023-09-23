//
//  PostsView.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import SwiftUI

struct PostsView: View {
    
    @State var show : Bool = false
    @ObservedObject var viewModel : PostsViewModel
    
    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ZStack{
            VStack(spacing: 16) {
                VStack{
                    ZStack{
                        HStack(alignment: .center) {
                            Asset.Assets.logo.image
                            Spacer()
                            Button {
                                show.toggle()
                            }label: {
                                Asset.Assets.search.image
                            }
                        }
                        
                        if show {
                            SearchTextField(show: $show, text: $viewModel.query)
                                .background(.white)
                                .onSubmit {
                                    submitSearch()
                                }
                                .onDisappear{
                                    submitSearch()
                                }
                        }
                    }
                    Divider()
                        .padding(.horizontal , -16)
                }
                
                List(viewModel.posts) { post in
                    PostRowView(post : post , query: viewModel.query)
                        .listRowSeparator(.hidden)
                        .onAppear{
                            viewModel.loadMorePosts(currentItem : post)
                        }
                }.listStyle(.plain)
                .padding(.horizontal , -16)
            }.padding(.horizontal, 16)
            
            CustomProgressView(isLoading: $viewModel.isLoading)
        }
        .frame(maxWidth : .infinity,
               maxHeight: .infinity)
    }
    
    func submitSearch(){
        viewModel.skip = 0
        viewModel.getPosts()
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(viewModel: PostsViewModel(repository: PostsRepositoryImplementation()))
    }
}
