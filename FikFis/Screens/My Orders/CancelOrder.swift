//
//  CancelOrder.swift
//  FikFis
//
//  Created by sveltetech on 24/08/24.
//

import SwiftUI

struct CancelOrder: View {
    
    var orders : [Order] = [
        Order(id: 0, title: "Kid shoes", imageUrl: "product1"),
        Order(id: 1, title: "Womens shoes", imageUrl: "paging1"),
        Order(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1", desc: "Return window open on 25 July 2024"),
        Order(id: 3, title: "Kid clothes", imageUrl: "paging1", desc: "Return window open on 25 July 2024"),
        Order(id: 4, title: "Min. 40% off | Washing machines", imageUrl: "paging1"),
        Order(id: 5, title: "Mens clothes", imageUrl: "product1")
    ]
    
    var body: some View {
//        NavigationHeader()

        ScrollView(.vertical, showsIndicators: false) {
            Spacer().frame(height: 5)
            ForEach(orders) { order in
                OrderView(item: order)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CancelOrder()
}
