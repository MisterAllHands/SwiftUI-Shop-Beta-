//
//  AppVieModel.swift
//  SwiftUITestProject
//
//  Created by TTGMOTSF on 15/03/2023.
//

import SwiftUI
import FirebaseAuth

class SigbUpViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signUp(email: String, password:String) {
        auth.createUser(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signIn(email: String, password: String){
        
        auth.signIn(withEmail: email, password: password){[weak self] result,error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
}
