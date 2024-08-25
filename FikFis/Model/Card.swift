//
//  Card.swift
//  FikFis
//
//  Created by apple on 11/08/24.
//

import Foundation


struct Card: Identifiable {
    var id: Int
    var title,imageUrl : String
}

struct TermsOfUse: Identifiable {
    var id: Int
    var title : String
}


struct AppOfferM: Identifiable {

    var id: Int
    var termsOfUse : [TermsOfUse]
    var validity,offerValue : String
}
