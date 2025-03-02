//
//  SignInView.swift
//  NutriSnap
//
//  Created by Valeria Arce on 2025-03-01.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                // Email
                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                // Password
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                // Forgot Password
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.forgotPassword()
                    }) {
                        Text("Forgot Password?")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                }
                
                // Sign In Button
                Button(action: {
                    viewModel.signIn()
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Sign Up Navigation
                HStack {
                    Text("Don't have an account?")
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .previewDevice("iPhone 14 Plus")
    }
}
