//
//  ForwardButton.swift
//  FikFis
//
//  Created by sveltetech on 21/08/24.
//

import SwiftUI

struct ForwardButton: View {
    var imageName : String
    var size: CGFloat = 30.0
    
    var body: some View {
        NavigationLink(destination: ProductListingV()){
            Image(systemName: imageName)
                .frame(width: size, height: size)
                .foregroundStyle(.white)
                .padding()
                .background {
                    Color.themeColor
                }
                .clipShape(Circle())
        }
    }
}

#Preview {
    ForwardButton(imageName: "arrow.forward")
}
