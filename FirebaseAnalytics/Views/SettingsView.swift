//
//  SettingsView.swift
//  FirebaseAnalytics
//
//  Created by apple on 10/24/23.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject{
    func signOut()throws {
        try AuthenticationManager.shared.signOut()
    }
    func resetPass() async throws -> Bool{
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        guard let email =  authUser.email else {
            return false
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
        return true
    }
    
//    func updateEmail()async throws -> String{
//        let email = "izzakhawar04@gmail.com"
//        let msg = try await AuthenticationManager.shared.updateEmail(email: email)
//        return msg
//    }
    func updatePassword()async throws{
        let password = "hello123@"
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
}




struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView : Bool
    @State private var showingAlert = false
    @State var msg : String = ""
    var body: some View {
        ZStack{
            ZStack {
                MainBackground()

                
                Design()
                    .padding(.all, 75.0)
            }
         
                VStack{
                    Button{
                        Task{
                            do{
                                try viewModel.signOut()
                                
                                showSignInView = true
                            }
                            catch{
                                print("Error: \(error.localizedDescription)")
                                
                                msg = "Logout Unsuccessful"
                                showingAlert = true
                            }
                        }
                    }label: {
                        Text("Log Out")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(10)
                            .padding(.horizontal,  110.0)
                        
                    }
                    .alert(msg, isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    
                    
                    Button{
                        Task{
                            do{
                                let linkGenerated = try await viewModel.resetPass()
                                let success = "Reset Link is send to Your Email"
                                let failiure = "Reset Link is not Generated"
                                msg = linkGenerated ? success : failiure
                                showingAlert = true
                            }
                            catch{
                                print("Error: \(error.localizedDescription)")
                                let error = String(error.localizedDescription)
                                msg = error
                                showingAlert = true
                            }
                        }
                    }label: {
                        Text("Reset Password")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(10)
                            .padding(.horizontal, 110.0)
                        
                    }
                    .alert(msg, isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    
                    Button{
                        Task{
                            do{
                                try await viewModel.updatePassword()
                                //                        let success = "Password Updated"
                                //                        let failiure = "Password not Updated"
                                //                        msg = passUpdated ? success : failiure
                                //                        showingAlert = true
                                msg = "Password Updated"
                                showingAlert = true
                            }
                            catch{
                                print("Error: \(error.localizedDescription)")
                                msg = "Error: \(error.localizedDescription)"
                                showingAlert = true
                                
                            }
                        }
                    }
                    label: {
                        Text("Update Password")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(10)
                            .padding(.horizontal,  110.0)
                        
                    }
                    .alert(msg, isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    
                    //            Button("Update Email"){
                    //                Task{
                    //                    do{
                    //                        msg = try await viewModel.updateEmail()
                    ////                        let success = "Email Updated"
                    ////                        let failiure = "Email not Updated"
                    ////                        msg = passUpdated ? success : failiure
                    ////                        showingAlert = true
                    //
                    //                        showingAlert = true
                    //                    }
                    //                    catch{
                    //                        print("Error: \(error.localizedDescription)")
                    //                        msg = "Error: \(error.localizedDescription)"
                    //                        showingAlert = true
                    //
                    //                    }
                    //                }
                    //            }
                    //            .alert(msg, isPresented: $showingAlert) {
                    //                Button("OK", role: .cancel) { }
                    //            }
                    
                }
            }
        
        .navigationTitle("Settings")
            
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        NavigationStack{
            SettingsView(showSignInView: .constant(false))
        }
    }
    else{
        SettingsView(showSignInView: .constant(false))
    }
}
