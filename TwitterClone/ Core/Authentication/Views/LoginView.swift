//
//  LoginView.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-08-16.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        //parent container
        VStack {
            //header view
            AuthenticationHeader(upperText: "Hello.", lowerText: "Welcome Back")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()

                NavigationLink {
                    Text("Reset Password View")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top)
                .padding(.trailing, 44)
            }
            
            Button {
                viewModel.signIn(withEmail: email, password: password)
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .foregroundColor(Color(.systemBlue))
                .padding(.bottom, 32)
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
