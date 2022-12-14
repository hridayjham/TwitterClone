//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Hriday Jham on 2022-08-16.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullName = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        //parent container
        NavigationStack {
            //NavigationLink(destination: ProfilePhotoSelectorView(), label: { })
                
            
            VStack {
                
                
                //header view
                AuthenticationHeader(upperText: "Get started.", lowerText: "Create your account")
                
                VStack(spacing: 40) {
                    CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    
                    CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                    
                    CustomInputField(imageName: "person", placeholderText: "Full name", text: $fullName)
                    
                    CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                    
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                
                Button {
                    viewModel.register(withEmail: email, password: password, fullname: fullName, username: username)
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
                .padding(.top, 32)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        
                        Text("Sign In")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    .padding(.bottom, 32)
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $viewModel.didAuthenticateUser) {

                    ProfilePhotoSelectorView()

            }
            
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
