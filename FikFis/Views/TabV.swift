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
                HomeV(coverImages: [ImagePagerM(image: UIImage(named: "paging1"), title: "1", titleColor: .red, action: {} ),ImagePagerM(image: UIImage(named: "paging2"), title: "1", titleColor: .red, action: {} )])
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
            
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor.theme.withAlphaComponent(1.0)
            
            // Use this appearance when scrolling behind the TabView:
            UITabBar.appearance().standardAppearance = appearance
            // Use this appearance when scrolled all the way up:
            UITabBar.appearance().scrollEdgeAppearance = appearance
            
            UITabBar.appearance().unselectedItemTintColor = .white
            UITabBar.appearance().tintColor = .black // Selected item color
            UITabBar.appearance().backgroundColor = UIColor.theme // Background color of the TabBar
        })
        
    }
}

#Preview {
    TabV()
}

