//
//  GridImage.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import SwiftUI

struct GridImage: View {
    
    var name : String
    var width : CGFloat
    var height : CGFloat
    var count : Int
    var index : Int
    init(name: String, width: CGFloat, height: CGFloat , count : Int,index : Int) {
        self.name = name
        self.width = width
        self.height = height
        self.count = count - 4
        self.index = index
    }
    var body: some View {
        
        ZStack{
            Image(name)
                .resizable()
                .scaledToFill()
                .frame(width: width , height: height)
                .clipped()
            
            if count > 0 && index == 3{
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
                Text("+\(count)")
                    .font(.appFont(fontStyle: .Bold, size: 20))
                    .foregroundColor(.white)
            }
        }
    }
}

struct GridImage_Previews: PreviewProvider {
    static var previews: some View {
        GridImage(name: "foodImage1", width: 170, height: 170, count: 5, index: 4)
    }
}
