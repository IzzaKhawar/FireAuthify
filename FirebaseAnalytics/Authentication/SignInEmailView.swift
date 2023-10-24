//
//  SignInEmailView.swift
//  FirebaseAnalytics
//
//  Created by apple on 10/24/23.
//

import SwiftUI

//MARK: View Model

@MainActor
final class SignInEmailViewModel:ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    
    func SignIn() async throws -> Bool{
        guard !email.isEmpty , !password.isEmpty else {
            print("No email or Password found...")
            return false
        }
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
               
        return true
    }
    
    
}

//MARK: View
struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView : Bool
    @State private var showingAlert = false
    @State var msg : String = ""
    var body: some View {
//MARK: Sign In with Email
        VStack{
            Text("Welcome Back")
            Text("Sign in to your account to Continue.")
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button{
                Task{
                    do{
                        let SignInSuccess = try await viewModel.SignIn()
                        showSignInView = SignInSuccess ? false : true
                        let success = "Sign In Successful"
                        let failiure = "No email or Password found..."
                        msg = SignInSuccess ? success : failiure
                        
                        
                        
                        showingAlert = true
                    }catch{
                        print("Error: \(error.localizedDescription)")
                        let error = String(error.localizedDescription)
                        msg = error
                        showingAlert = true
                        showSignInView = true
                    }
                }
                    
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .alert(msg, isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            
            
            
            Text("No account?")
            NavigationLink {
                SignUpEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Create an account...")
                    .font(.headline)
                    
                    
            }
            
        }
        .padding()
        .navigationTitle("Email Sign in")
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        NavigationStack{
            SignInEmailView(showSignInView: .constant(false))
        }
    }
    else{
        SignInEmailView(showSignInView: .constant(false))
    }
}
