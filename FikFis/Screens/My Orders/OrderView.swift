//
//  OrderView.swift
//  FikFis
//
//  Created by sveltetech on 25/08/24.
//

import SwiftUI

struct OrderView: View {
    
    var item: Order
    var hideBtn: Bool = false
    
    var body: some View {
        HStack {
            Image(item.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .border(Color(uiColor: .systemGray3))
                .cardViewStyle()
            
            VStack(alignment: .leading) {
                Text(item.title).font(.custom_font(.regular, size: 15)).lineLimit(2)
                if let desc = item.desc {
                    Text(desc).font(.custom_font(.regular, size: 12)).lineLimit(1).foregroundStyle(.green)
                }
                Text("ORDER # \(item.id)").font(.custom_font(.regular, size: 12)).lineLimit(1)
                Spacer()
            }
            Spacer()
        }
        .padding(.bottom, 5)
        .overlay(alignment: .bottomTrailing, content: {
            if !hideBtn {
                NavigationLink(destination: OrderDetail(item: item), label: {
                    Image(systemName: "arrow.forward")
                })
                .foregroundStyle(.white)
                .padding(10)
                .background {
                    Color.themeColor
                }
                .clipShape(Circle())
                .padding(.bottom, 9)
            }
        })
    }
}

#Preview {
    OrderView(item: Order(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1", desc: "Return window open on 25 July 2024"))
}
