//
//  RootView.swift
//  FirebaseAnalytics
//
//  Created by apple on 10/24/23.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView : Bool = false
    init() {
        // Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        ZStack{
            if #available(iOS 16.0, *) {
                NavigationStack{
                    SettingsView(showSignInView: $showSignInView)
                }
            }
            else{
                SettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = ((authUser == nil) ? true : false)
            
        }
        .fullScreenCover(isPresented: $showSignInView) {
            if #available(iOS 16.0, *) {
                NavigationStack{
                    PreSignInView(showSignInView: $showSignInView)
                }
            }
            else{
                PreSignInView(showSignInView: $showSignInView )
            }
        }
        
        
    }
}

#Preview {
    RootView()
}
