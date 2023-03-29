

//
//  SwiftUIView.swift
//  SwiftUITestProject
//
//  Created by TTGMOTSF on 15/03/2023.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: SigbUpViewModel

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

    var body: some View {
        VStack {
            Spacer()

            Text("Welcome Back")
                .font(Font.custom("Montserrat-Regular", size: 40))

            ZStack {
                Text("Email")
                    .foregroundColor(.gray)
                    .opacity(email.isEmpty ? 0.7 : 0)
                    .multilineTextAlignment(.center)
                TextField("", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .font(.system(size: 17,weight: .bold))
                    .frame(width: 285,height: 40)
                    .padding(.leading, 20)
                    .textContentType(.name)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(50.0)
                    .padding()
            }

            ZStack {
                Text("Password")
                    .foregroundColor(.gray)
                    .opacity(password.isEmpty ? 0.7 : 0)
                    .multilineTextAlignment(.center)
                HStack{
                    if self.showPassword {
                        TextField("", text: $password).padding(.trailing, -50)
                    } else {
                        SecureField("", text: $password).padding(.trailing, -50)
                    }
                    Button(action: {self.showPassword.toggle()}) {
                        Image(systemName: self.showPassword ? "eye.fill":"eye.slash.fill")
                            .foregroundColor((self.showPassword == true) ? Color.blue : Color.secondary)
                    }.offset(x: -15, y: 0)
                } //HStack
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .font(.system(size: 17,weight: .bold))
                .padding(.leading, 20)
                .textContentType(.name)
                .frame(width: 300,height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(50.0)
                .padding()
            } //ZStack

            Button(action: {
                viewModel.signIn(email: email, password: password)
            }, label: {
                Text("Log in")
                    .foregroundColor(Color.white)
            })
            .foregroundColor(.white)
            .frame(width: 300,height: 50)
            .background(Image("signInButton"))
            Spacer()
            Spacer()

        }.padding([.leading, .trailing])

            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                Text("Back")
            }))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(SigbUpViewModel())
    }
}
