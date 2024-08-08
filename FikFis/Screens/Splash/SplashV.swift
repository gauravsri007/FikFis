//
//  SplashV.swift
//  FikFis
//
//  Created by apple on 31/07/24.
//

import SwiftUI
struct SplashV: View {
    var body: some View {
        NavigationStack {
            Group {
                Image("splash")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                    .background(Color.yellow)
            }
        }
    }
}

#Preview {
    SplashV()
}
