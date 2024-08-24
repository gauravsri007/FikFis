//
//  HomeNavigationV.swift
//  FikFis
//
//  Created by apple on 11/08/24.
//

import SwiftUI

struct HomeNavigationV: View {
    var body: some View {
        VStack(spacing: 0) {
            Color.themeColor
                .ignoresSafeArea(.all, edges: .top)
                .frame(height: 0) // Extend the theme color into the top safe area

            HStack {
                VStack(alignment: .leading){
                    Text("Welcome FikFis")
                        .font(.custom_font(.semiBold, size: 34))
                    Text("Free Shipping | \(7) Days Return")
                        .font(.custom_font(.medium, size: 15))
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: {
                    // handle tap
                }) {
                    Image("bell_navigation")
                        .renderingMode(.template)
                        .foregroundStyle(Color.black)
                        .padding(10)
                        .background {
                            Circle()
                                .foregroundStyle(Color.white)
                        }
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 15)
            .font(.headline)
            .frame(height: 80)
        }
        .background(Color.themeColor.ignoresSafeArea(.all).cornerRadius(30, corners: [.bottomLeft, .bottomRight]))
    }
}


#Preview {
    HomeNavigationV()
}
