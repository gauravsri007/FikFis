//
//  App_offersV.swift
//  FikFis
//
//  Created by apple on 24/08/24.
//

import SwiftUI



struct App_offersV: View {

    @State var arrOffers = AppOfferM.all()
    
    var body: some View {
        
        NavigationHeader(isBellIconHidden: false)
        
        VStack(spacing: 0){
            collectionSection
        }
    }
    
    var collectionSection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading){
                ForEach(arrOffers) { appOffers in
                    OfferRow(appOffer: appOffers)
                }
            }
            .padding(.top, 6)
            .padding(.horizontal)
        }
    }
}

#Preview {
    App_offersV(arrOffers: AppOfferM.all())
}
