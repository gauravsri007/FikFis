//
//  GlogalModal.swift
//  FikFis
//
//  Created by apple on 14/11/24.
//

import Foundation

struct GlogalModal: Identifiable {
    var id = UUID()
    var message: String?
    
    init(dic :[String:Any]) {
        self.message = dic["message"] as? String ?? ""
    }
}
