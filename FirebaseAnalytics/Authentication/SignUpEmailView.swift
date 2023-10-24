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
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
        return true
    }
    
    
}

//MARK: View
struct SignUpEmailView: View {
    @StateObject private var viewModel = SignUpEmailViewModel()
    @Binding var showSignInView : Bool
    @State private var showingAlert = false
    @State var msg : String = ""
    var body: some View {
        //MARK: Sign Up with Email
        VStack{
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
                        let SignUpSuccess = try await viewModel.SignUp()
                        print("SignUp Success")
                        showSignInView = false
                    
                        let success = "Sign In Successful"
                        let failiure = "No email or Password found..."
                        msg = SignUpSuccess ? success : failiure
                        
                        
                        
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
                Text("Sign Up")
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
        }
        .padding()
        .navigationTitle("Sign Up With Email")
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

