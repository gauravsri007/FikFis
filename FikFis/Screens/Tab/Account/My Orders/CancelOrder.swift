//
//  CancelOrder.swift
//  FikFis
//
//  Created by sveltetech on 24/08/24.
//

import SwiftUI

struct CancelOrder: View {
    
    var orders = Order.all()

    var body: some View {
//        NavigationHeader()

        ScrollView(.vertical, showsIndicators: false) {
            Spacer().frame(height: 5)
            ForEach(orders) { order in
                OrderView(item: order)
            }
        }
        .padding(.horizontal)
        .toolbar(.hidden, for: .tabBar)

    }
}

#Preview {
    CancelOrder()
}
