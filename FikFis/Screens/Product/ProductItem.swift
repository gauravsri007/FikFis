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
                .frame(height: 160)
                .cardViewStyle()
            Text(item.title)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
            StarRatingView(rating: .constant(3))
                .frame(width: 120, height: 30)
            HStack {
                Text("$105100")
                    .bold()
                Text("$105100")
                    .strikethrough()
            }
            
            HStack {
                Text("Save $5")
                    .padding(5)
                    .background {
                        Color.green.cornerRadius(5)
                    }
                Text("$105100")
                    .strikethrough()
            }
        }
        .frame(height: 340)
        .padding(5)
        .cardViewStyle()
    }
}

#Preview {
    ProductItem(item: Card(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1"))
}
