//
//  CollectionView.swift
//  FikFis
//
//  Created by sveltetech on 21/08/24.
//

import SwiftUI

struct CollectionView: View {
    let item : Card
    @State var size: CGFloat = 85
    var body: some View {
        VStack {
            Image("\(item.imageUrl)")
                .resizable()
                .cornerRadius(12)
                .frame(width: size, height: size)
                .aspectRatio(contentMode: .fill)
            Text(item.title)
                .font(.custom_font(.regular,size: 12))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: size, height: 60, alignment: .top)
        }
    }
}

#Preview {
    CollectionView(item: Card(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1"))
}
