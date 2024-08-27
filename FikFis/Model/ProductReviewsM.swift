//
//  ProductReviewsM.swift
//  FikFis
//
//  Created by apple on 26/08/24.
//

import Foundation

struct ProductReviewsM: Identifiable {
    var id,productRating: Int
    var productName,orderNumber,imageUrl,review : String
    var reviewImages : [String]
}
