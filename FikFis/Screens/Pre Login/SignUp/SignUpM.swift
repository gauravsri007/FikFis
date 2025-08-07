//
//  SignUpM.swift
//  FikFis
//
//  Created by apple on 14/11/24.
//

import Foundation

struct SignUpM: Identifiable {
    var id = UUID()
    var phone = String()
    var email = String()
    var username = String()
    var message = String()
    var access_token = String()
    var refresh_token = String()
    
    init(dic :[String:Any]) {
        self.phone = dic["phone"] as? String ?? ""
        self.email = dic["email"] as? String ?? ""
        self.username = dic["username"] as? String ?? ""
        self.message = dic["message"] as? String ?? ""
        self.access_token = dic["access_token"] as? String ?? ""
        self.refresh_token = dic["refresh_token"] as? String ?? ""
    }
}
