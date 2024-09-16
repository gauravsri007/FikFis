//
//  ReviewModel.swift
//  FikFis
//
//  Created by apple on 01/09/24.
//

import Foundation

struct ReviewM: Identifiable {
    let id = UUID()
    let profile: String
    let userName: String
    let description: String
    let images : [String]?
}


extension ReviewM {
    
    static func all() -> [ReviewM] {
        return [
            ReviewM(profile: "product", userName: "Jack kallis", description: "Aku cobain produk ini masih jaman sekolah, karna gak tau apa produk yg bagus. Dan alhamdulillah ini ", images: ["product1","product2","product3","product1","product2","product3"]),
            ReviewM(profile: "product", userName: "Jack kallis", description: "Aku cobain produk ini masih jaman sekolah, karna gak tau apa produk yg bagus. Dan alhamdulillah ini ", images: ["product1","product2","product3","product1","product2","product3"]),
            ReviewM(profile: "product", userName: "Jack kallis", description: "Aku cobain produk ini masih jaman sekolah, karna gak tau apa produk yg bagus. Dan alhamdulillah ini ", images: ["product1","product2","product3","product1","product2","product3"]),
            ReviewM(profile: "product", userName: "Jack kallis", description: "Aku cobain produk ini masih jaman sekolah, karna gak tau apa produk yg bagus. Dan alhamdulillah ini ", images: ["product1","product2","product3","product1","product2","product3"]),
            ReviewM(profile: "product", userName: "Jack kallis", description: "Aku cobain produk ini masih jaman sekolah, karna gak tau apa produk yg bagus. Dan alhamdulillah ini ", images: ["product1","product2","product3","product1","product2","product3"]),
            ReviewM(profile: "product", userName: "Jack kallis", description: "Aku cobain produk ini masih jaman sekolah, karna gak tau apa produk yg bagus. Dan alhamdulillah ini ", images: ["product1","product2","product3","product1","product2","product3"])]
            
    }
}
