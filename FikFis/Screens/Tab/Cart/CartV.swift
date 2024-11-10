//
//  CartV.swift
//  FikFis
//
//  Created by apple on 05/08/24.
//

import SwiftUI

struct CartV: View {
    @State private var selectedTab: Tab_cart = .Items
    @Namespace private var animationNamespace //
    var body: some View {
        VStack(alignment: .leading) {
            NavigationHeader(isBellIconHidden: false)
                .padding(.bottom)

            HeaderLabel(header: "Your Carts",font: header_font)
                .padding(.leading)
            Group {
                VStack {
                    // Tab content with slide-in animation
                    // Tab buttons
                    HStack {
                        CustomTab(label: "Items", selectedTab: $selectedTab, tab: .Items, animationNamespace: animationNamespace)
                        Spacer()
                        CustomTab(label: "Shipping", selectedTab: $selectedTab, tab: .Shipping, animationNamespace: animationNamespace)
                        Spacer()
                        CustomTab(label: "Payment", selectedTab: $selectedTab, tab: .Payment, animationNamespace: animationNamespace)
                    }
                    .padding()
                    //                    .background(Color.gray.opacity(0.2))
                    ZStack {
                        if selectedTab == .Items {
                            ItemsV(orderSummary: OrderSummaryModel(items_total: 2000.0, items_discount: 100.0, delivery: 10.0, tax: 10.0))                            //                              .transition(.move(edge: .leading))
                                .animation(.easeInOut, value: selectedTab)
                        } else if selectedTab == .Shipping {
                            ShippingV(orderSummary: OrderSummaryModel(items_total: 2000.0, items_discount: 100.0, delivery: 10.0, tax: 10.0))                            //                              .transition(.move(edge: .trailing))
                                .animation(.easeInOut, value: selectedTab)
                        } else if selectedTab == .Payment {
                            PaymentV()
                            
                            //                              .transition(.move(edge: .trailing))
                                .animation(.easeInOut, value: selectedTab)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(height: appHeight - 400)
                    
                }
                
            }
            .frame(width: appWidth)
        }
        .toolbar(.visible, for: .tabBar)
    }
}

#Preview {
    CartV()
}
