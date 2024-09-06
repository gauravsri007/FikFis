//
//  NoticationModel.swift
//  FikFis
//
//  Created by apple on 06/09/24.
//

import Foundation


struct NotificationM: Identifiable {

    var id = UUID()
    var productName,productDescription,productImage : String
}


extension NotificationM{
    static func all() -> [NotificationM] {
        return [
            NotificationM(productName: "Kid shoes", productDescription: "Unsupported layout off the main thread for UICollectionView with nearest ancestor view controller", productImage: "product1"),
            NotificationM(productName: "Kid shoes",productDescription: "Unsupported layout off the main thread for UICollectionView with nearest ancestor view controller", productImage: "product1"),
            NotificationM(productName: "Kid shoes", productDescription: "Unsupported layout off the main thread for UICollectionView with nearest ancestor view controller", productImage: "product1"),
            NotificationM(productName: "Kid shoes", productDescription: "Unsupported layout off the main thread for UICollectionView with nearest ancestor view controller", productImage: "product1"),
            NotificationM(productName: "Kid shoes", productDescription: "Unsupported layout off the main thread for UICollectionView with nearest ancestor view controller", productImage: "product1"),
            NotificationM(productName: "Kid shoes", productDescription: "Unsupported layout off the main thread for UICollectionView with nearest ancestor view controller", productImage: "product1"),
            NotificationM(productName: "Kid shoes", productDescription: "Unsupported layout off the main thread for UICollectionView with nearest ancestor view controller", productImage: "product1"),
            NotificationM(productName: "Kid shoes", productDescription: "Unsupported layout off the main thread for UICollectionView with nearest ancestor view controller", productImage: "product1")
        ]
    }
}
