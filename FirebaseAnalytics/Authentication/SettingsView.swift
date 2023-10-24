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
//            throw URLError(.fileDoesNotExist)
            return false
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
        return true
    }
}


struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView : Bool
    @State private var showingAlert = false
    @State var msg : String = ""
    var body: some View {
        List{
            Button("Log Out"){
                Task{
                    do{
                        try viewModel.signOut()
                        showSignInView = true
                    }
                    catch{
                        print("Error: \(error)")
                    }
                }
            }
            
            Button("Reset Password"){
                Task{
                    do{
                        let linkGenerated = try await viewModel.resetPass()
                        let success = "Reset Link is send to Your Email"
                        let failiure = "Reset Link is not Generated"
                         msg = linkGenerated ? success : failiure
                        showingAlert = true
                    }
                    catch{
                        print("Error: \(error)")
                    }
                }
            }
            .alert(msg, isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
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
