//
//  SwiftUITestProjectApp.swift
//  SwiftUITestProject
//
//  Created by TTGMOTSF on 12/03/2023.
//

import SwiftUI
import Firebase

@main
struct SwiftUITestProjectApp: App {
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            
            return true
        }
    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                let viewModel = AppViewModel()
                SignUp()
                    .environmentObject(viewModel)
            }
        }
    }
}

