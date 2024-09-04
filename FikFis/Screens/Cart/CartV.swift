//
//  CartV.swift
//  FikFis
//
//  Created by apple on 05/08/24.
//

import SwiftUI
import PagerTabStripView

struct CartV: View {
    var body: some View {
        NavigationHeader()
        
        VStack(alignment: .leading) {
            Text("Your Carts")
                .font(.custom_font(.medium, size: 30))
                .padding()
            Rectangle()
                .foregroundStyle(Color.themeColor)
                .frame(width: 100, height: 5)
                .padding(.leading)
                .padding(.top, -20)
            PagerTabStripView() {
                ItemsV(orderSummary: OrderSummaryModel(items_total: 2000.0, items_discount: 100.0, delivery: 10.0, tax: 10.0))
                    .pagerTabItem(tag: 0) {
                        TitleNavBarItem(title: "Items")
                    }
//                DeliveredOrders()
//                    .pagerTabItem(tag: 1) {
//                        TitleNavBarItem(title: "Shipping")
//                    }
//                ReturnOrder()
//                    .pagerTabItem(tag: 2) {
//                        TitleNavBarItem(title: "Payment")
//                    }
//                ConfirmationV()
//                    .pagerTabItem(tag: 3) {
//                        TitleNavBarItem(title: "Confirmation")
//                    }
            }
            .pagerTabStripViewStyle(.scrollableBarButton(
                padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                indicatorView: { Rectangle().fill(Color.themeColor).cornerRadius(5).frame(height: 5).padding(.top, -8) }
            ))
        }
    }
}

#Preview {
    CartV()
}
