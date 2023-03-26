//
//  RegistraionView.swift
//  Plant
//
//  Created by Никита Куприянов on 18.03.2023.
//

import SwiftUI

struct RegistraionView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var fullname: String = ""
    @State private var password: String = ""
    var body: some View {
        Group {
            if !viewModel.showPicker {
                VStack {
                    
                    AuthHeaderView(title1: "Get Started.", title2: "Create Your Account")
                    
                    VStack(spacing: 40) {
                        CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                        CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                        CustomInputField(imageName: "person", placeholderText: "Full name", text: $fullname)
                        CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                        
                        Button {
                            viewModel.register(with: email, password: password, fullname: fullname, username: username)
                        } label: {
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .frame(width: 340, height: 50)
                                .background(Color(.systemBlue))
                                .clipShape(Capsule())
                                .padding()
                        }
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                        .buttonStyle(.plain)
                        
                    }
                    .padding(32)
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Text("Already have an account?")
                                .font(.caption)
                            Text("Sign In")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.bottom, 32)
                    .foregroundColor(Color(.systemBlue))
                    
                }.ignoresSafeArea()
            } else {
                ProfilePhotoSelectorView()
                    .environmentObject(viewModel)
            }
        }
    }
}

struct RegistraionView_Previews: PreviewProvider {
    static var previews: some View {
        RegistraionView()
            .environmentObject(AuthViewModel())
    }
}
