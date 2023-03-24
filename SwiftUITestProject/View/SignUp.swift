//
//  SignUp.swift
//  SwiftUITestProject
//
//  Created by TTGMOTSF on 15/03/2023.
//
import SwiftUI
import FirebaseAuth

struct SignUp: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State private var shouldOpenFirstPage = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                if viewModel.signedIn {
                    PageOneView()
                } else {
                    SignInView()
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear {
//            viewModel.signedIn = viewModel.isSignedIn
            print("ting")
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
            .environmentObject(AppViewModel())
    }
}

struct SignInView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State private var isPresentingLogin = false
    @State private var firstName = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sign up")
                    .font(.custom("Montserrat-Regular", size: 40))
                    .padding()
                VStack {
                    PlaceHolderField(text: $firstName, placeholder: "Full name")
                    PlaceHolderField(text: $email, placeholder: "Email")
                }
                
                PlaceHolderField(text: $password, placeholder: "Password", isSecure: true)
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {return}
                    viewModel.signUp(email: email, password: password)
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Image("signInButton"))
                }
                
                HStack {
                    Text("Already have an account?")
                    Button(action: {
                        isPresentingLogin = true
                    }) {
                        Text("Log in")
                            .foregroundColor(Color.blue.opacity(1.0))
                    }
                }
                .foregroundColor(Color.black.opacity(0.7))
                .font(.system(size: 13,weight: .regular))
                .padding(.leading, -150.0)
                .padding()
                .fullScreenCover(isPresented: $isPresentingLogin) {
                    NavigationView {
                        LoginView()
                    }
                }
                
                SignInMethods(image: Image("google"), text: "Sign in with Google")
                SignInMethods(image: Image("apple"), text: "Sign in with Apple")
                
            }.padding([.leading, .trailing])
        }
    }
}

struct PlaceHolderField: View {
    
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool = false
    
    var body: some View {
        ZStack{
            Text(placeholder)
                .foregroundColor(.gray)
                .opacity(text.isEmpty ? 0.7 : 0)
                .multilineTextAlignment(.center)
            if isSecure {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
            }
        }
        .autocapitalization(.none)
        .padding(.leading, 20)
        .font(.system(size: 17,weight: .bold))
        .frame(width: 300, height: 40)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(50.0)
        .padding()
        .disableAutocorrection(true)
    }
}

struct SignInMethods: View {
    
    var image: Image
    var text: String
    var body: some View {
        HStack{
            image
                .padding(.horizontal)
            Button(action: {
                print("Trying to sign in with \(text)")
            }, label: {
                Text(text)
            })
            .offset(x: -15)
        }
        .foregroundColor(Color.black.opacity(0.8))
        .font(.system(size: 17, weight: .semibold))
        .background(Color.white)
        .padding()
    }
}

