//
//  CustomProgressView.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import SwiftUI
import SwiftUI
import LoaderUI

struct CustomProgressView: View {
    
    @Binding var isLoading : Bool
    var body: some View {
        if isLoading {
            Rectangle()
                .foregroundColor(Color.black.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
                                LineScalePulseOut()
                .frame(width: 100 ,height: 100)
                .foregroundColor(.white)
        }
    }
}
