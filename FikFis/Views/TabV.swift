//
//  TabV.swift
//  FikFis
//
//  Created by apple on 11/08/24.
//

import SwiftUI

struct TabV: View {
    @State private var selectedIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            //---------------------------------------
            NavigationStack() {
                OffersV()
            }
            .tabItem {
                Text("Home")
                Image("home")
                    .renderingMode(.template)
            }
            .tag(0)
            //---------------------------------------

            NavigationStack() {
                OffersV()
            }
            .tabItem {
                Text("Offer")
                Image("offer")
                    .renderingMode(.template)
            }
            .tag(1)
            //---------------------------------------

            NavigationStack() {
                AccountV()
            }
            .tabItem {
                Text("Account")
                Image("account")
                    .renderingMode(.template)
            }
//            .badge("12")
            .tag(2)
            //---------------------------------------

            NavigationStack() {
                CategoryV()
                
            }
            .tabItem {
                Image("category")
                Text("Categoty")
            }
            .tag(3)
//            .badge("12")
            //---------------------------------------

            NavigationStack() {
                CartV()
            }
            .tabItem {
                Text("Cart")
                Image("cart")
                    .renderingMode(.template)
            }
            .badge("12")
            .tag(4)
            //---------------------------------------

        }
        .tint(.black)
        .onAppear(perform: {
            //2
            UITabBar.appearance().unselectedItemTintColor = .white
            //3
            UITabBarItem.appearance().badgeColor = .systemPink
            //4
            UITabBar.appearance().backgroundColor = UIColor.theme            //5
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            //UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
            //Above API will kind of override other behaviour and bring the default UI for TabView
        })
        
    }
}

#Preview {
    TabV()
}
