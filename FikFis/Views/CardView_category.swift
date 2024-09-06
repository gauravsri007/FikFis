//
//  CardView_category.swift
//  FikFis
//
//  Created by apple on 11/08/24.
//

import SwiftUI

struct CardView_category: View {
    var collection1 = Card.all()
    
    var body: some View {
        VStack(alignment: .leading) {

            HeaderLabel(header: "Main Category")

            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [
                    GridItem(.flexible(), alignment: .top),
                    GridItem(.flexible(), alignment: .top),
                    GridItem(.flexible(), alignment: .top),
                    GridItem(.flexible(), alignment: .top)

                ]) {
                    ForEach(collection1) { collection in
                        CollectionView(item: collection)
                    }
                }
//                .padding(.top, 6)
                .padding([.all],15)
            }
        }
        .padding(.leading,5)
    }
}

#Preview {
    CardView_category()
}
