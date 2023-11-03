////
////  User.swift
////  FirebaseAnalytics
////
////  Created by apple on 10/26/23.
////
//import Firebase
//import FirebaseAuth
//
//struct User: Identifiable, Codable, Equatable {
//    var id: String?
//    var name: String?
//    var email: String?
//    var profileImageURL: String?
//    var link: String?
//    var password: String?
//    
//    init() {
//        // Empty initializer
//    }
////    init(vm: ) {
////        self.id = Auth.auth().currentUser?.uid
////        self.name = vm.name
////        self.link = vm.link
////        self.profileImageURL = vm.profileImageURL
////    }
//    // A separate async function to update user properties
//    mutating func updateProperties(email: String, password: String) {
//        self.email = email
//        self.password = password
//    }
//    
//    // Asynchronous initialization
//    static func initialize(vm: SignUpEmailViewModel) async -> User {
//        var user = User()
//        let email = await vm.email
//        let password = await vm.password
//        await user.updateProperties(email: email, password: password)
//        return user
//    }
//}
//
