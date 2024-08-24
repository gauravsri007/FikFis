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
                .aspectRatio(contentMode: .fill)
                .frame(width: appWidth/2.4, height: 120)
                .border(Color(uiColor: .systemGray3))
                .cardViewStyle()
            Text(item.title)
                .font(.custom_font(.regular, size: 14))
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
        .padding(.bottom, 8)
    }
}
#Preview {
    FrameView(item: Card(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1"))
}
