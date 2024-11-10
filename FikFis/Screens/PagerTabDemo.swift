//
//  PagerTabDemo.swift
//  FikFis
//
//  Created by apple on 04/11/24.
//

import SwiftUI
import PagerTabStripView
import XLPagerTabStrip

struct PagerTabDemo: View {
    @State var selection = 0

    var body: some View {
        PagerTabStripView(selection: $selection) {

            SupportV()
                .pagerTabItem(tag: 0) {
                    TitleNavBarItem(title: "Tab 1")
                }
//                .pagerTabItem(tag: 1) {
//                    Text("Tab 1")
//                }
            LoginV()
                .pagerTabItem(tag: 1) {
                    TitleNavBarItem(title: "Tab 2")
                }
//                .pagerTabItem(tag: 2) {
//                    Text("Tab 2")
//                }
        }
//        .pagerTabStripViewStyle(.scrollableBarButton(
//            padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//            indicatorView: { Rectangle().fill(Color.themeColor).cornerRadius(5).frame(height: 5).padding(.top, -8) }
//        ))
//        .frame(width: appWidth)
//        .background(Color.themeColor)
        .pagerTabStripViewStyle(.scrollableBarButton(tabItemSpacing: 15,
                             tabItemHeight: 50,
                                 indicatorView: {
                                    Rectangle().fill(.blue).cornerRadius(5)
                                     }))
    }
}

#Preview {
    PagerTabDemo()
}
