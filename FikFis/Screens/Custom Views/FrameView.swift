//
//  FrameView.swift
//  FikFis
//
//  Created by sveltetech on 21/08/24.
//

import SwiftUI

struct FrameView: View {
    let item : Card
    var body: some View {
        VStack(alignment: .leading) {
            Image("\(item.imageUrl)")
                .resizable()
                .frame(height: 120)
                .cardViewStyle()
            Text(item.title)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
        .frame(height: 170)
    }
}
#Preview {
    FrameView(item: Card(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1"))
}
