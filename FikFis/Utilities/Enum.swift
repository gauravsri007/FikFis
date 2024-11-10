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

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
}


enum Alert_message:String{
    case success
    case fail
}


enum Tab_cart {
    case Items, Shipping, Payment, Confirmation
}

enum Tab_orders {
    case ActiveOrders, DeliveredOrders, ReturnOrder, CancelOrder
}

enum Tab_address {
    case AddAddress, SavedAddress
}
