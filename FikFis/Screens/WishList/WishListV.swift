//
//  WishListV.swift
//  FikFis
//
//  Created by apple on 25/08/24.
//

import SwiftUI

struct WishListV: View {
    var arrWishList : [ProductM]
    var body: some View {
        NavigationHeader()

        VStack(alignment: .leading){
            HeaderLabel(header: "Your Wishlist Waiting...")
                .padding(.leading)

            ScrollView(.vertical, showsIndicators: false) {
                    ForEach(arrWishList) { wishList in
                        Product_wishList(product: wishList, productCount: 1)
                    }
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    WishListV(arrWishList: [
        ProductM(id: 0, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35"),
        ProductM(id: 1, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35"),
        ProductM(id: 2, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35"),
        ProductM(id: 3, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35")])
}
