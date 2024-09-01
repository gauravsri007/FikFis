//
//  ProductM.swift
//  FikFis
//
//  Created by apple on 25/08/24.
//

import Foundation

struct ProductM: Identifiable {
    var id,productRating: Int
    var productName,productPrice,imageUrl,ProductDiscount : String
}




extension ProductM {
    
    static func all() -> [ProductM] {
        return [
            ProductM(id: 0, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35"),
            ProductM(id: 1, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35"),
            ProductM(id: 2, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35"),
            ProductM(id: 3, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35")]
    }
}
