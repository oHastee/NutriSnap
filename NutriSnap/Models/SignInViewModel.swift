//
//  SignInViewModel.swift
//  NutriSnap
//
//  Created by Oscar Piedrasanta Diaz on 2025-03-02.
//


import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func forgotPassword() {
        // Placeholder for Forgot Password logic
        print("Forgot Password tapped for email: \(email)")
    }
    
    func signIn() {
        // Placeholder for Sign In logic
        print("Sign In with email: \(email), password: \(password)")
    }
}
