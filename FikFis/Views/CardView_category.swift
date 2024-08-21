//
//  CardView_category.swift
//  FikFis
//
//  Created by apple on 11/08/24.
//

import SwiftUI

struct CardView_category: View {
    var collection1 : [Card] = [
        Card(id: 0, title: "Kid shoes", imageUrl: "product1"),
        Card(id: 1, title: "Womens shoes", imageUrl: "paging1"),
        Card(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1"),
        Card(id: 3, title: "Kid clothes", imageUrl: "paging1"),
        Card(id: 4, title: "Min. 40% off | Washing machines", imageUrl: "paging1"),
        Card(id: 5, title: "Mens clothes", imageUrl: "product1")
    ]
    
    var body: some View {
        VStack{
            Group(){
                LazyVStack(alignment: .leading) {
                    Text("Main Category")
                        .font(.custom_font(.medium,size: 30))
                        .underline(true,pattern: .solid, color: .yellow)
                }
                .padding([.leading],10)
            }

            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [
                    GridItem(.flexible(), alignment: .top),
                    GridItem(.flexible(), alignment: .top),
                    GridItem(.flexible(), alignment: .top),
                    GridItem(.flexible(), alignment: .top)

                ]) {
                    ForEach(collection1) { collection in
                        CollectionView(collec: collection)
                    }
                }
                .padding(.top, 6)
                .padding(.horizontal)
            }
        }
        .padding(.leading,5)
    }
}

#Preview {
    CardView_category()
}
