//
//  ReviewsV.swift
//  FikFis
//
//  Created by apple on 26/08/24.
//

import SwiftUI

struct ReviewsV: View {
    var arrReviews : [ProductReviewsM]
    var arrReviewImages : [String]
    
    var body: some View {
        NavigationHeader()

        ScrollView(.vertical, showsIndicators: false) {
                ForEach(arrReviews) { reviews in
                    ReviewsCell(arrImages: arrReviewImages, productReview: ProductReviewsM(id: 0, productRating: 2, productName: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage)", orderNumber: "33435333R", imageUrl: "product", review: "Aku cobain produk ini masih jaman sekolah, karna gak tau apa produk yg bagus. Dan alhamdulillah ini ", reviewImages: ["product","product","product","product","product","product","product","product"]), productCount: 1)
                }
        }
        .padding()
    }
}

#Preview {
    ReviewsV(arrReviews: [ProductReviewsM(id: 0, productRating: 3, productName: "rfwer", orderNumber: "3252352352", imageUrl: "product", review: "ewrwewetwet", reviewImages: ["product","product","product","product","product","product","product","product"]),
                          ProductReviewsM(id: 1, productRating: 3, productName: "rfwer", orderNumber: "3252352352", imageUrl: "product", review: "ewrwewetwet", reviewImages: ["product","product","product","product","product","product","product","product"]),
                          ProductReviewsM(id: 2, productRating: 3, productName: "rfwer", orderNumber: "3252352352", imageUrl: "product", review: "ewrwewetwet", reviewImages: ["product","product","product","product","product","product","product","product"])], arrReviewImages: ["product","product","product","product","product","product","product","product"])
}
