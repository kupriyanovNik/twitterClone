//
//  LoginView.swift
//  Plant
//
//  Created by Никита Куприянов on 18.03.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var passsword: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Hello.", title2: "Welcome Back")
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $passsword)
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 44)
            
            HStack {
                Spacer()
                NavigationLink {
                    Text("reset password view")
                } label: {
                    Text("Forgot password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }

            }
            
            Button {
                viewModel.login(with: email, password: passsword)
            } label: {
                Text("Sing In")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            .buttonStyle(.plain)

            
            Spacer()
            
            NavigationLink {
                RegistraionView()
                    .environmentObject(viewModel)
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.caption)
                    Text("Sign Up")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))

        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}

struct RoundedShape: Shape {
    let corners: UIRectCorner
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        return Path(path.cgPath)
    }
}
