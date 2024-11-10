//
//  MyOrders.swift
//  FikFis
//
//  Created by sveltetech on 24/08/24.
//

import SwiftUI

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
    @State private var selectedTab: Tab_orders = .ActiveOrders
    @Namespace private var animationNamespace //
    var body: some View {
        VStack(alignment: .leading) {
            
            NavigationHeader(isBellIconHidden: false)
            
            HeaderLabel(header: "Your Orders")
                .padding(.leading)

            Group {
                VStack {
                    // Tab content with slide-in animation
                    // Tab buttons
                    HStack {
                        CustomTabOrders(label: "Active Orders", selectedTab: $selectedTab, tab: .ActiveOrders, animationNamespace: animationNamespace)
                        Spacer()
                        CustomTabOrders(label: "Delivered Orders", selectedTab: $selectedTab, tab: .DeliveredOrders, animationNamespace: animationNamespace)
                        Spacer()
                        CustomTabOrders(label: "Return Order", selectedTab: $selectedTab, tab: .ReturnOrder, animationNamespace: animationNamespace)
                        Spacer()
                        CustomTabOrders(label: "Cancel Order", selectedTab: $selectedTab, tab: .CancelOrder, animationNamespace: animationNamespace)
                    }
                    .padding()
                    //                    .background(Color.gray.opacity(0.2))
                    ZStack {
                        if selectedTab == .ActiveOrders {
                            ActiveOrders()                            //                              .transition(.move(edge: .leading))
                                .animation(.easeInOut, value: selectedTab)
                        } else if selectedTab == .DeliveredOrders {
                            DeliveredOrders()                            //                              .transition(.move(edge: .trailing))
                                .animation(.easeInOut, value: selectedTab)
                        } else if selectedTab == .ReturnOrder {
                            ReturnOrder()
                            //                              .transition(.move(edge: .trailing))
                                .animation(.easeInOut, value: selectedTab)
                        }
                        else if selectedTab == .CancelOrder {
                            CancelOrder()
                            //                              .transition(.move(edge: .trailing))
                                .animation(.easeInOut, value: selectedTab)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(height: appHeight - 400)
                    
                }
            }
        }
    }
}

#Preview {
    MyOrders()
}


struct CustomTabOrders: View {
    var label: String
    @Binding var selectedTab: Tab_orders
    var tab: Tab_orders
    var animationNamespace: Namespace.ID

    var body: some View {
        VStack {
            Text(label)
                .frame(height: 32)
                .lineLimit(2)
                .font(.custom_font(.medium,size: 12))
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
