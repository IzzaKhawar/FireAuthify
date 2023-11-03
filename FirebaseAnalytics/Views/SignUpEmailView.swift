//
//  SignUpEmailView.swift
//  FirebaseAnalytics
//
//  Created by apple on 10/24/23.
//

import SwiftUI

//MARK: View Model

@MainActor
final class SignUpEmailViewModel :  ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func SignUp() async throws ->Bool{
        guard !email.isEmpty , !password.isEmpty else {
            print("No email or Password found...")
            return false
        }
        
        let resultCreateUser = try await AuthenticationManager.shared.createUser(email: email, password: password)
        
        return resultCreateUser.uid.isEmpty ? false : true
    }
    
    
}

//MARK: View
struct SignUpEmailView: View {
    @StateObject private var viewModel = SignUpEmailViewModel()
    @Binding var showSignInView : Bool
    @State private var showingAlert = false
    @State var msg : String = ""
    var body: some View {
        
        ZStack{
            SignInBackground()
            //MARK: Sign Up with Email
            VStack{
                TextField("Email...", text: $viewModel.email)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(10)
                    .padding(.horizontal, 390.0)
                SecureField("Password...", text: $viewModel.password)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(10)
                    .padding(.horizontal, 390.0)
                
                Button{
                    Task{
                        do{
                            let SignUpSuccess = try await viewModel.SignUp()
                            print("SignUp Success")
                            showSignInView = false
                            
                            let success = "Sign Up Successful"
                            let failiure = "No email or Password found..."
                            msg = SignUpSuccess ? success : failiure
                            
                            
                            
                            showingAlert = true
                        }catch{
                            print("Error: \(error.localizedDescription)")
                            let errorMsg = String(error.localizedDescription)
                            msg = errorMsg
                            showingAlert = true
                            showSignInView = true
                        }
                    }
                    
                } label: {
                    Text("Sign Up")
                        .font(.headline)
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
            }
            .padding()
           
            .navigationTitle("Sign Up")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        NavigationStack{
            SignUpEmailView(showSignInView: .constant(false))
        }
    }
    else{
        SignUpEmailView(showSignInView: .constant(false))
    }
}

