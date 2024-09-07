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
        VStack(alignment: .leading) {
            NavigationHeader(isBellIconHidden: false)

            HeaderLabel(header: "Your Carts").frame(height: 60)
            
            PagerTabStripView() {
                ItemsV(orderSummary: OrderSummaryModel(items_total: 2000.0, items_discount: 100.0, delivery: 10.0, tax: 10.0))
                    .pagerTabItem(tag: 0) {
                        TitleNavBarItem(title: "Items")
                    }
                DeliveredOrders()
                    .pagerTabItem(tag: 1) {
                        TitleNavBarItem(title: "Shipping")
                    }
                ReturnOrder()
                    .pagerTabItem(tag: 2) {
                        TitleNavBarItem(title: "Payment")
                    }
                ConfirmationV()
                    .pagerTabItem(tag: 3) {
                        TitleNavBarItem(title: "Confirmation")
                    }
            }
            .pagerTabStripViewStyle(.scrollableBarButton(
                padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                indicatorView: { Rectangle().fill(Color.themeColor).cornerRadius(5).frame(height: 5).padding(.top, -8) }
            ))
            .frame(width: appWidth)
        }
    }
}

#Preview {
    CartV()
}
