//
//  Enum.swift
//  FikFis
//
//  Created by apple on 07/08/24.
//

import Foundation


enum Tab : String,CaseIterable{
    case Home = "home"
    case Offer = "offer"
    case Account = "account"
    case Category = "category"
    case Cart = "cart"
    var Tabname : String{
        switch self {
        case .Home:
            return "Home"
        case .Offer:
            return "Offer"
        case .Account:
            return "Account"
        case .Category:
            return "Category"
        case .Cart:
            return "Cart"
        }
        
    }

}

enum PaymentMode : String,CaseIterable{
    case cashOnDeliverr = "cashOnDeliverr"
    case online = "online"
    
}

