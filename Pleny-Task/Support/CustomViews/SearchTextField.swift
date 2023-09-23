//
//  SearchTextField.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var show : Bool
    @Binding var text: String
    var body: some View {
        VStack (alignment: .leading){
            HStack(spacing: 8) {
                Asset.Assets.search.image
                    .frame(width: 16 , height: 16, alignment: .leading)

                TextField("Search For Food", text: $text)
                    .font(.appFont(fontStyle: .Regular , size: 17))
                    .padding(.horizontal, 8)
                Button {
                    text = ""
                    show.toggle()
                }label: {
                    Asset.Assets.close.image
                }
            }
            .padding(12)
            .createBorder(cornerRadius: 8, inset: 0.5, color: Asset.Colors.grey300.color, width: 1)
        }
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(show: .constant(false), text: .constant("Food"))
    }
}
