//
//  CustomTab.swift
//  FikFis
//
//  Created by apple on 10/11/24.
//

import SwiftUI

struct CustomTab: View {
    var label: String
    @Binding var selectedTab: Tab_cart
    var tab: Tab_cart
    var animationNamespace: Namespace.ID

    var body: some View {
        VStack {
            Text(label)
                .font(.custom_font(.medium,size: 16))
                .foregroundColor(.black)

            if selectedTab == tab {
                Color.themeColor
                    .frame(height: 4)
                    .matchedGeometryEffect(id: "underline", in: animationNamespace)
            } else {
                Color.clear.frame(height: 4)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedTab = tab
            }
        }
    }
}

