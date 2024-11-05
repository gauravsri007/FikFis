//
//  ForwardButton.swift
//  FikFis
//
//  Created by sveltetech on 21/08/24.
//

import SwiftUI

struct ForwardButton<Destination: View>: View {
    var imageName : String
    var size: CGFloat = 30.0
    var action: (() -> Void)?
    var destination: Destination?
    
    @State private var navigateToScreen: Bool = false
    
    var body: some View {
        Button(action: {
            (action ?? {})()
            navigateToScreen.toggle()
        }, label: {
            Image(systemName: imageName)
                .frame(width: size, height: size)
                .foregroundStyle(.white)
                .padding()
                .background {
                    Color.themeColor
                }
                .clipShape(Circle())
        })
        .navigationDestination(isPresented: $navigateToScreen, destination: {
            destination
        })
    }
}

#Preview {
    ForwardButton(imageName: "arrow.forward", action: nil, destination: ProductListingV())
}
