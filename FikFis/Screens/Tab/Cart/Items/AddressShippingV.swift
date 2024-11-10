//
//  AddressShippingV.swift
//  FikFis
//
//  Created by apple on 10/11/24.
//

import SwiftUI

struct AddressShippingV: View {
    @State private var selectedTab: Tab_address = .AddAddress
    @Namespace private var animationNamespace //

    var body: some View {
        Group {
            VStack {
                // Tab content with slide-in animation
                // Tab buttons
                HStack {
                    CustomTab_address(label: "Add Address", selectedTab: $selectedTab, tab: .AddAddress, animationNamespace: animationNamespace)
                    Spacer()
                    CustomTab_address(label: "Saved Address", selectedTab: $selectedTab, tab: .SavedAddress, animationNamespace: animationNamespace)
                }
                .padding()
                //                    .background(Color.gray.opacity(0.2))
                ZStack {
                    if selectedTab == .AddAddress {
                        AddAddress()                           //                              .transition(.move(edge: .leading))
                            .animation(.easeInOut, value: selectedTab)
                    } else if selectedTab == .SavedAddress {
                        YourAddress()                            //                              .transition(.move(edge: .trailing))
                            .animation(.easeInOut, value: selectedTab)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .frame(height: appHeight - 400)
                
            }
            
        }
        .frame(width: appWidth)    }
}

#Preview {
    AddressShippingV()
}


struct CustomTab_address: View {
    var label: String
    @Binding var selectedTab: Tab_address
    var tab: Tab_address
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
