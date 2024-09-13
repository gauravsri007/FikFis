//
//  ProductListingV.swift
//  FikFis
//
//  Created by apple on 08/09/24.
//

import SwiftUI

struct ProductListingV: View {
    var arrProductItems = Card.all()

    
    var body: some View {
        
        NavigationHeader(isBellIconHidden: false)
        
        VStack(alignment: .leading ){
            productItemCollectionSection
        }
    }
    
    var productItemCollectionSection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [
                GridItem(.flexible(), alignment: .top),
                GridItem(.flexible(), alignment: .top)
            ], content: {
                ForEach(arrProductItems) { collection in
                    ProductItem(item: collection)
                }
            })
        }.padding([.horizontal], 8)
    }
}

#Preview {
    ProductListingV()
}
