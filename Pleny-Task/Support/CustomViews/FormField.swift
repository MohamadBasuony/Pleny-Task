//
//  FormField.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 18/09/2023.
//

import SwiftUI

struct FormField: View {
    
    @Binding var value : String 
    var title : String
    var placeHolder : String
    var isPasswordField : Bool
    @State var validationModel: ValidationModel = ValidationModel()
    let validationPublisher: ValidationPublisher

    @State private var secured = true

    var body: some View {
        VStack(alignment: .leading,spacing: 6){
            Text(title)
                .foregroundColor(Asset.Colors.grey700.color)
                .font(.appFont(fontStyle: .SemiBold, size: 15))
            
            HStack{
                if secured && isPasswordField{
                    SecureField("••••••••••",text:$value)
                        .font(.appFont(fontStyle: .Regular , size: 17))
                }else{
                    TextField(placeHolder, text: $value)
                        .font(.appFont(fontStyle: .Regular, size: 17))
                }
                
                if isPasswordField {
                    Button {
                        secured.toggle()
                    } label: {
                        (secured ? Asset.Assets.showPassword.image : Asset.Assets.hidePassword.image)
                            .foregroundColor(Asset.Colors.iconTint.color)
                            .frame(width: 16 , height: 16)
                        
                    }
                }

            }.padding(.horizontal, 14)
             .padding(.vertical, 10)
             .createBorder(cornerRadius: 8, inset: 0.5, color: Asset.Colors.grey300.color, width: 1)
           
            validationMessage
            
        }
        .frame(maxWidth: .infinity,
               alignment: .topLeading)
        .onReceive(validationPublisher) { model in
            self.validationModel = model
        }
    }
    
    var validationMessage : some View {
        if validationModel.isValid {
            return AnyView(EmptyView())
        }else{
            let text =  Text(validationModel.message)
                .font(.appFont(fontStyle: .Medium, size: 14))
                .foregroundColor(.red)
                .multilineTextAlignment(.leading)
                .layoutPriority(1)
            
            return AnyView(text)
        }
    }
}

//struct FormField_Previews: PreviewProvider {
//    static var previews: some View {
//        FormField(title: "User Name", placeHolder: "Enter your user Name", isPasswordField: false)
//    }
//}
