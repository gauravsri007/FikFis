//
//  WishListV.swift
//  FikFis
//
//  Created by apple on 25/08/24.
//

import SwiftUI

struct WishListV: View {
    var arrWishList = ProductM.all()
    var body: some View {
        NavigationHeader(isBellIconHidden: false)

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
    WishListV()
}
