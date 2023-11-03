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
        let resultLogUser = try await AuthenticationManager.shared.signInUser(email: email, password: password)
               
        return resultLogUser.uid.isEmpty ? false : true
    }
    
    
}

//MARK: View
struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView : Bool
    @State private var showingAlert = false
    @State var msg : String = ""
    var body: some View {
        ZStack{
          LogInBackground()
//            Design()
//                .padding(.all, 430.0)
//            
            
            //MARK: Sign In with Email
            VStack{
                Text("Welcome Back")
                    .font(.title2)
                    .fontWeight(.medium)
                Text("Sign in to your account to Continue.")
                    .font(.title3)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                TextField("Email...", text: $viewModel.email)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(10)
                    .padding(.horizontal, 390.0)
                    
                SecureField("Password...", text: $viewModel.password)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(10)
                    .padding(.horizontal, 390.0)
                   
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
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 390.0)
                        
                }
                .alert(msg, isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                
                
                Text("No account?")
                    .foregroundColor(.white)
                NavigationLink {
                    SignUpEmailView(showSignInView: $showSignInView)
                } label: {
                    Text("Create an account...")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.cyan)
                    
                    
                }
                
            }
            .padding()
            
            
            
            .navigationTitle("LogIn")
            .navigationBarTitleDisplayMode(.large)
               
        }
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
