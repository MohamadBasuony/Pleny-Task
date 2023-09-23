//
//  ContentView.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 17/09/2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel : LoginViewModel
    @State var isSaveDisabled = true


    init (viewModel : LoginViewModel ){
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    VStack(spacing: 24) {
                        Asset.Assets.loginImage.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .ignoresSafeArea()
                        
                        Text("Welcome")
                            .foregroundColor(Asset.Colors.primaryColor.color)
                            .font(.appFont(fontStyle: .Bold, size: 20))

                        VStack(alignment: .leading,spacing: 24) {
                            
                            FormField(value: $viewModel.model.username, title: "User Name", placeHolder: "Enter your user name", isPasswordField: false,validationPublisher: viewModel.nameValidation)
                            FormField(value: $viewModel.model.password,title: "Password", placeHolder: "Enter your password", isPasswordField: true,validationPublisher: viewModel.passwordValidation)
                            MainButton(action: {
                                viewModel.login()
                            }, title: "Login")
                            .disabled(isSaveDisabled)
                        }.padding(.horizontal , 16)
                    }
                }.frame(maxWidth: UIScreen.main.bounds.width,
                                    maxHeight: .infinity,
                                    alignment: .topLeading)
                             .padding(.vertical , 0)
                             .ignoresSafeArea()
                             .onReceive(viewModel.allFieldsValid) { validation in
                                 self.isSaveDisabled = !validation
                             }
                CustomProgressView(isLoading: $viewModel.isLoading)
            }
        }.fullScreenCover(isPresented: $viewModel.didLogin) {

            TabbarView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(model: LoginModel(), repository: AuthRepositoryImplementation(),coordinator: LoginCoordinator()))
    }
}
