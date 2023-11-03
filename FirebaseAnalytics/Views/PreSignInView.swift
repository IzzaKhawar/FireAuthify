//
//  PreSignInView.swift
//  FirebaseAnalytics
//
//  Created by apple on 10/24/23.
//

import SwiftUI

//MARK: View Model

@MainActor
final class PreSignInViewModel :  ObservableObject {
    
    
    
}

//MARK: View


struct PreSignInView: View {
    @Binding var showSignInView : Bool
    let myColor4 = Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))

    var body: some View {
        
        ZStack{
            
                MainBackground()
            Background1()
                .padding(.bottom, 550.0)
                
            Design()
                .padding(.all, 90.0)
                
            
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
                        .background(myColor4)
                        .cornerRadius(15)
                        .padding(.horizontal, 90.0)
                        
                }
                .padding()
     
               
             
              
       
                
            }
            
            .padding()
           
        }
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
