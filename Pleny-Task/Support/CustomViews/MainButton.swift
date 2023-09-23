//
//  MainButton.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 18/09/2023.
//

import SwiftUI

struct MainButton: View {
    var action : () -> Void
    var title : String
    var body: some View {
        Button(
            action: {
                action()
            }, label: {
                Text(title)
                    .frame(height: 46)
                    .padding(.horizontal , 16)
                    .frame(maxWidth: .infinity)
                    .background(Asset.Colors.primaryColor.color)
                    .cornerRadius(24)
                    .foregroundColor(.white)
            }
        )
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(action: {}, title: "Login")
    }
}
