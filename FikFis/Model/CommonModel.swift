//
//  CommonModel.swift
//  FikFis
//
//  Created by sveltetech on 06/09/24.
//

import Foundation

struct CommonModel: Identifiable {
    var id: Int
    var title : String
    var desc: String?
    var image: String?
    var rating: String?
    var price: Int?
    var discountedPrice: Int?
    var discount: String?
    var reviewCount: Int?

}
