//
//  PreSignInView.swift
//  FirebaseAnalytics
//
//  Created by apple on 10/24/23.
//

import SwiftUI

struct PreSignInView: View {
    @Binding var showSignInView : Bool
   

    var body: some View {
        VStack{
            
            
//MARK: Sign In with Email

            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Sign in with Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
            

            
        }
        .padding()
        .navigationTitle("Sign In")
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        NavigationStack{
            PreSignInView(showSignInView : .constant(false))
        }
    } else {
        PreSignInView(showSignInView: .constant(false))
    }
}
