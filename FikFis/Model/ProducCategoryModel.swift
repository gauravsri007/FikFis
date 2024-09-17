//
//  ProducCategoryCell.swift
//  FikFis
//
//  Created by apple on 16/09/24.
//

import Foundation


struct ProducCategoryModel: Identifiable {
    let id = UUID()
    var name,imageUrl : String
    var discount,price : String
    let isFavorite: Bool
}


extension ProducCategoryModel{
    static func all() -> [ProducCategoryModel] {
        return [
            ProducCategoryModel(name: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage)", imageUrl: "product1",discount: "3899",price: "399", isFavorite: false),
            ProducCategoryModel(name: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage)", imageUrl: "product1",discount: "3899",price: "399", isFavorite: false),
            ProducCategoryModel(name: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage)", imageUrl: "product1",discount: "3899",price: "399", isFavorite: false),
            ProducCategoryModel(name: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage)", imageUrl: "product1",discount: "3899",price: "399", isFavorite: false),
            ProducCategoryModel(name: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage)", imageUrl: "product1",discount: "3899",price: "399", isFavorite: false),
            ProducCategoryModel(name: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage)", imageUrl: "product1",discount: "3899",price: "399", isFavorite: false),
            ProducCategoryModel(name: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage)", imageUrl: "product1",discount: "3899",price: "399", isFavorite: false),
            ProducCategoryModel(name: "Kid shoes", imageUrl: "product1",discount: "3899",price: "399", isFavorite: false),
            ProducCategoryModel(name: "Kid shoes", imageUrl: "product1",discount: "3899",price: "399", isFavorite: false),
        ]
    }
}
