//
//  MyOrders.swift
//  FikFis
//
//  Created by sveltetech on 24/08/24.
//

import SwiftUI
import PagerTabStripView

struct TitleNavBarItem: View {
    let title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.custom_font(.regular, size: 18))
                .lineLimit(1)
            Rectangle()
                .foregroundStyle(Color.init(hex: "E7E7E7"))
                .frame(height: 5)
        }
        .frame(width: 160, height: 50)
    }
}

struct MyOrders: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Orders")
                .font(.custom_font(.medium, size: 30))
                .padding()
            Rectangle()
                .foregroundStyle(Color.themeColor)
                .frame(width: 100, height: 5)
                .padding(.leading)
                .padding(.top, -20)
            PagerTabStripView() {
                ActiveOrders()
                    .pagerTabItem(tag: 0) {
                        TitleNavBarItem(title: "Active Orders")
                    }
                DeliveredOrders()
                    .pagerTabItem(tag: 1) {
                        TitleNavBarItem(title: "Delivered Orders")
                    }
                ReturnOrder()
                    .pagerTabItem(tag: 2) {
                        TitleNavBarItem(title: "Return Order")
                    }
                CancelOrder()
                    .pagerTabItem(tag: 3) {
                        TitleNavBarItem(title: "Cancel Order")
                    }
            }
            .pagerTabStripViewStyle(.scrollableBarButton(
                padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                indicatorView: { Rectangle().fill(Color.themeColor).cornerRadius(5).frame(height: 5).padding(.top, -8) }
            ))
        }
    }
}

#Preview {
    MyOrders()
}
