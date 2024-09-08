//
//  Card.swift
//  FikFis
//
//  Created by apple on 11/08/24.
//

import Foundation


struct Card: Identifiable {
    var id: Int
    var title,imageUrl : String
}

struct TermsOfUse: Identifiable {
    var id: Int
    var title : String
}


struct AppOfferM: Identifiable {

    var id = UUID()
    var termsOfUse : [TermsOfUse]
    var validity,offerValue : String
}

extension AppOfferM{
    static func all() -> [AppOfferM] {
        return [
            AppOfferM(termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
            AppOfferM(termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
            AppOfferM(termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
            AppOfferM(termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
            AppOfferM(termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100"),
            AppOfferM(termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100")
        ]
    }
}

extension Card{
    static func all() -> [Card] {
        return [
            Card(id: 0, title: "Kid shoes", imageUrl: "product1"),
            Card(id: 1, title: "Womens shoes", imageUrl: "product2"),
            Card(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1"),
            Card(id: 3, title: "Kid clothes", imageUrl: "product2"),
            Card(id: 4, title: "Min. 40% off | Washing machines", imageUrl: "product1"),
            Card(id: 5, title: "Mens clothes", imageUrl: "product2"),
            Card(id: 6, title: "Kid shoes", imageUrl: "product1"),
            Card(id: 7, title: "Womens shoes", imageUrl: "product2"),
            Card(id: 8, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1"),
            Card(id: 9, title: "Kid clothes", imageUrl: "product1"),
            Card(id: 10, title: "Min. 40% off | Washing machines", imageUrl: "product2"),
            Card(id: 11, title: "Mens clothes", imageUrl: "product1"),
            Card(id: 12, title: "Kid shoes", imageUrl: "product1"),
            Card(id: 13, title: "Womens shoes", imageUrl: "product1"),
            Card(id: 14, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1"),
            Card(id: 15, title: "Kid clothes", imageUrl: "product1"),
            Card(id: 16, title: "Min. 40% off | Washing machines", imageUrl: "product2"),
            Card(id: 17, title: "Mens clothes", imageUrl: "product1")
        ]
    }
}
