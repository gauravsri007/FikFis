//
//  ProductItem.swift
//  FikFis
//
//  Created by sveltetech on 21/08/24.
//

import SwiftUI

struct ProductItem: View {
    let item : Card
    var body: some View {
        VStack(alignment: .leading) {
            
            Image("\(item.imageUrl)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: appWidth/2.5, height: appWidth/2.5)
                .cardViewStyle()
                .cornerRadius(6)
                .clipped()
            
            Text(item.title)
                .font(.custom_font(.medium, size: 14))
                .multilineTextAlignment(.leading)
                .lineLimit(3)
            
            StarRatingView(rating: .constant(3))
                .frame(width: 105, height: 15)
            
            Text("$105100"+"   ").font(.custom_font(.semiBold, size: 14)) + Text("$105100").foregroundStyle(Color.init(hex: "#727272")).font(.custom_font(.semiBold, size: 14)).strikethrough()
            
            HStack {
                Text("Save $5")
                    .font(.custom_font(.semiBold, size: 12))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(5)
                    .background {
                        Color.init(hex: "#719B62").cornerRadius(5)
                    }
                Text("With coupon")
                    .font(.custom_font(.semiBold, size: 13))
                    .bold()
            }
        }
        .frame(width: appWidth/2.4)
        .padding(.top, 8)
        .padding(.bottom, 10)
        .padding(.horizontal, 5)
        .cardViewStyle()
        .padding(.top, 2)
        .padding(.bottom, 12)
    }
}

#Preview {
    ProductItem(item: Card(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "paging1"))
}
