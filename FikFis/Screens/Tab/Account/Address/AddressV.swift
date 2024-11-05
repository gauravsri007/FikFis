//
//  AddressV.swift
//  FikFis
//
//  Created by apple on 25/09/24.
//

import SwiftUI
//import PagerTabStripView
import XLPagerTabStrip

struct AddressV: View {
    
    @Binding var presentView: Bool
    
    var body: some View {
        VStack {
//            PagerTabStripView() {
//                ActiveOrders()
//                    .pagerTabItem(tag: 0) {
//                        TitleNavBarItem(title: "Add Address")
//                    }
//                DeliveredOrders()
//                    .pagerTabItem(tag: 1) {
//                        TitleNavBarItem(title: "Saved Address")
//                    }
//            }
//            .pagerTabStripViewStyle(.scrollableBarButton(
//                padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                indicatorView: { Rectangle().fill(Color.themeColor).cornerRadius(5).frame(height: 5).padding(.top, -8) }
//            ))
//            .frame(width: appWidth-100, height: appHeight-200)
//            .background(.white)
//            .cornerRadius(10)
        }
        .frame(width: appWidth, height: appHeight)
        .background(.black.opacity(0.3))
        .onTapGesture {
            presentView.toggle()
        }
    }
}

#Preview {
    AddressV(presentView: .constant(true))
}
