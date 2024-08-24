//
//  CollectionView.swift
//  FikFis
//
//  Created by sveltetech on 21/08/24.
//

import SwiftUI

struct CollectionView: View {
    let item : Card
    @State var size: CGFloat = 90
    var body: some View {
        VStack {
            Image("\(item.imageUrl)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipped()
                .cornerRadius(12)
            Text(item.title)
                .font(.custom_font(.medium, size: 16))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: size, height: 60, alignment: .top)
        }
        .frame(width: size, height: size+60)
    }
}

#Preview {
    CollectionView(item: Card(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1"))
}
