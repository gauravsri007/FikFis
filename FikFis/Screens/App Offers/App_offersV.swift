//
//  App_offersV.swift
//  FikFis
//
//  Created by apple on 24/08/24.
//

import SwiftUI



struct App_offersV: View {

    @State var arrOffers : [AppOfferM] = [
        AppOfferM(id: 0, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
        AppOfferM(id: 1, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
        AppOfferM(id: 2, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
        AppOfferM(id: 3, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
        AppOfferM(id: 4, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100")

      
    ]
     
    
    var body: some View {
        VStack(spacing: 0){
            NavigationHeader()
            Spacer()
//            collectionSection
        }
    }
    
    var collectionSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(arrOffers) { appOffers in
                    App_offersV(arrOffers: [
                        AppOfferM(id: 0, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
                        AppOfferM(id: 1, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
                        AppOfferM(id: 2, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
                        AppOfferM(id: 3, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
                        AppOfferM(id: 4, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100")

                      
                    ]
                    )
                }
            }
            .padding(.top, 6)
            .padding(.horizontal)
        }
    }
}

#Preview {
    App_offersV(arrOffers: [
        AppOfferM(id: 0, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
        AppOfferM(id: 1, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
        AppOfferM(id: 2, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
        AppOfferM(id: 3, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
        AppOfferM(id: 4, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100")
    ])
}
