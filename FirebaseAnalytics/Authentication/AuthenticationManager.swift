//
//  AuthenticationManager.swift
//  FirebaseAnalytics
//
//  Created by apple on 10/24/23.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid : String
    let email : String?
    let photoUrl : String?
    init(user : FirebaseAuth.User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
    
}

final class AuthenticationManager{
    
    static let shared = AuthenticationManager()
    private init(){ }
    
    func getAuthenticatedUser() throws -> AuthDataResultModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
            
        }
        return AuthDataResultModel(user: user)
    }
    
    @discardableResult
    func createUser(email : String , password : String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    @discardableResult
    func signInUser(email : String , password : String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    
    func signOut()throws {
        try Auth.auth().signOut()
    }
    func resetPassword(email : String) async throws{
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    func updatePassword(password : String)async throws{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        try await user.updatePassword(to: password)
    }
    
    
//   func updateEmail(email: String) async throws -> String {
//        var msg : String = ""
//        guard let user = Auth.auth().currentUser else {
//            return "No Current User Found"
//        }
//        let usr = await User.initialize(vm: SignUpEmailViewModel())
//
////        user.email = email
//        let newEmail = email
//        
//        // Check if the new email is already verified
//        if user.isEmailVerified {
//            // The new email is already verified, so you can update it directly
//            do {
//                try await user.updateEmail(to: newEmail)
//                print("Email updated successfully.")
//                msg = "Email updated successfully."
//                return msg
//            } catch {
//                // Handle any update email errors
//                print("Error updating email: \(error)")
//                msg = "\(error.localizedDescription)"
//                return msg
//            }
//        } else {
//            // The new email is not verified, so send a verification email
//            user.sendEmailVerification { error in
//                if let error = error {
//                    // Handle the email verification error
//                    print("Error sending verification email: \(error)")
//                    msg =  "\(error.localizedDescription)"
//                } else {
//                    // Email verification sent
//                    print("Email verification sent. Please verify your new email address.")
//                    // You can inform the user to check their email and verify it.
//                    msg = "Success"
//                }
//            }
//        }
//        return msg
//    }
//

}
