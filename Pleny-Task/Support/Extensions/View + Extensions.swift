//
//  View + Extensions.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import Foundation
import SwiftUI

extension View {
    func createBorder(cornerRadius : CGFloat ,inset : Double , color : Color , width : CGFloat) -> some View {
        return overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .inset(by: inset)
                .stroke(color, lineWidth: width)
        )
    }
}

extension View {
    func navigate<V: View>(to view: V , when binding :Binding<Bool>) -> some View {
        NavigationLink(destination: view, isActive: binding) {
            EmptyView()
        }
    }
}
