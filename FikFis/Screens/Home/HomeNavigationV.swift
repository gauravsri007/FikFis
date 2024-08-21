//
//  HomeNavigationV.swift
//  FikFis
//
//  Created by apple on 11/08/24.
//

import SwiftUI

struct HomeNavigationV: View {
    var body: some View {
        HStack(){
            VStack(alignment: .leading){
                Text("Welcome FikFis")
                    .font(.custom_font(.semibold,size: 34))
                Text("Free Shipping | \(7) Days Return")
                    .font(.custom_font(.regular,size: 15))
                    .foregroundColor(.white)
            }
            .padding(20)
            Spacer()
            Button(action: {
                // handle tap
            }) {
                Image("bell_navigation")
                    .renderingMode(.template)
                    .foregroundStyle(Color.black)
                    .padding(15)
                    .background {
                        Circle()
                            .foregroundStyle(Color.white)
                    }
            }
            .padding(20)
            
        }
        .font(.headline)
        .background(Color.yellow.ignoresSafeArea())
    }
}

#Preview {
    HomeNavigationV()
}
