//
//  TabV.swift
//  FikFis
//
//  Created by apple on 11/08/24.
//

import SwiftUI

struct TabV: View {
    @State private var selectedIndex: Int = 0
    @StateObject private var overlayManager = OverlayManager() // Create OverlayManager instance
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            //---------------------------------------
            NavigationStack() {
                HomeV(coverImages: [ImagePagerM(image: UIImage(named: "paging1"), title: "1", titleColor: .red, action: {} ),ImagePagerM(image: UIImage(named: "paging2"), title: "1", titleColor: .red, action: {} )])
            }
            .tabItem {
                Text("Home")
                Image("home")
            }
            .tag(0)
            //---------------------------------------

            NavigationStack() {
                App_offersV()
            }
            .tabItem {
                Text("Offer")
                Image("offer")
            }
            .tag(1)
            //---------------------------------------

            NavigationStack() {
                AccountV()
            }
            .tabItem {
                Text("Account")
                Image("account")
            }
//            .badge("12")
            .tag(2)
            //---------------------------------------

            NavigationStack() {
                CategoryV(header: "Main Category")
                
            }
            .tabItem {
                Text("Category")
                Image("category")
            }
            .tag(3)
//            .badge("12")
            //---------------------------------------

            NavigationStack {
                CartV()
            }
            .tabItem {
                Text("Cart")
                Image("cart")
            }
            .badge("12")
            .tag(4)
            //---------------------------------------

        }
        .tint(.black)
        .onAppear(perform: {
            
            UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.themeColor)
            //UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
            
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor.theme.withAlphaComponent(1.0)

            // Tint colors
            appearance.stackedLayoutAppearance.normal.iconColor = .white // Unselected icon color
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white] // Unselected text color
            appearance.stackedLayoutAppearance.selected.iconColor = .black // Selected icon color
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black] // Selected text color

            // Apply appearances
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        })
        .overlay {
            if let overlayContent = overlayManager.overlayContent {
                overlayContent
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Full screen
                    .background(Color.black.opacity(0.4).ignoresSafeArea()) // Background color with ignoresSafeArea
                    .onTapGesture {
                        if overlayManager.shouldDismissOnTap {
                            overlayManager.hide()
                        }
                    }
            }
        }
        .environmentObject(overlayManager) // Provide environment object
        
    }
}

#Preview {
    TabV()
}

