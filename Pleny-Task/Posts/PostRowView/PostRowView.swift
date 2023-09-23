//
//  PostRowView.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import SwiftUI

struct PostRowView: View {
    
    var post : Post
    var query : String
    @State var singleImageGridLayout: [GridItem] = [GridItem(.flexible()) ]
    @State var gridLayout: [GridItem] = [ GridItem(.flexible()) , GridItem(.flexible())]
    var width : CGFloat
    var height : CGFloat
    
    init(post: Post, query: String) {
        self.post = post
        self.query = query
        
        self.width = (((post.images?.count ?? 0) == 1)) ? UIScreen.main.bounds.width - 32 : (UIScreen.main.bounds.width - 35)/2
        self.height = (((post.images?.count ?? 0) == 3)) ? 550 : 180
    }
    
    var body: some View {
        VStack(spacing: 14) {
            HStack{
                Image(post.profileImage ?? "")
                VStack(alignment: .leading) {
                    Text(post.title ?? "")
                        .font(.appFont(fontStyle: .SemiBold, size: 17))
                        .foregroundColor(Asset.Colors.grey900.color)
                    Text("1 Sec Ago")
                        .font(.appFont(fontStyle: .Regular, size: 13))
                        .foregroundColor(Asset.Colors.grey600.color)
                }
                Spacer()
                Button {
                    dump("Do Something")
                }label: {
                    Asset.Assets.actionsIcon.image
                }
            }
            highlightText()
                .foregroundColor(Asset.Colors.grey700.color)
                .multilineTextAlignment(.leading)
            ScrollView{
                
                
                LazyHGrid(rows: ((post.images?.count ?? 0) == 1) ? singleImageGridLayout : gridLayout, alignment: .center, spacing: 3) {
                    Section() {
                        ForEach((((post.images?.count ?? 0) <= 3)) ? 0..<1 : 0..<2 , id: \.self) { index in
                            GridImage(name: post.images?[index] ?? "", width: width, height: height, count: 0, index: index)
                        }
                    }
                    if (post.images?.count ?? 0) > 2 {
                        Section() {
                            ForEach(((post.images?.count ?? 0) == 3) ? 1..<3 : 2..<4, id: \.self) { index in
                                GridImage(name: post.images?[index] ?? "", width: width, height: 180, count: post.images?.count ?? 0, index: index)
                            }
                        }
                    }
                }
                .frame(height: (post.images?.count ?? 0) > 2 ? 356 : 180)
                .cornerRadius(8)
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .topLeading)
    }
    
    func highlightText() -> Text {
        guard !(post.body ?? "").isEmpty && !query.isEmpty else { return Text((post.body ?? "")).font(.appFont(fontStyle: .Regular, size: 16)) }

           var result: Text!
           let parts = (post.body ?? "").components(separatedBy: query)
           for i in parts.indices {
               result = (result == nil ? Text(parts[i]) : result + Text(parts[i]))
               if i != parts.count - 1 {
                   result = result.font(.appFont(fontStyle: .Regular, size: 16)) + Text(query).font(.appFont(fontStyle: .Bold, size: 16))
               }
           }
           return result ?? Text((post.body ?? ""))
       }
}
