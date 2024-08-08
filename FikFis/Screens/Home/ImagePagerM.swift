//
//  ImagePagerM.swift
//  FikFis
//
//  Created by apple on 05/08/24.
//

import Foundation
import UIKit

struct ImagePagerM: Hashable {
    var image: UIImage?
    var title: String
    var titleColor: UIColor
    var action: () -> Void

    static func == (lhs: ImagePagerM, rhs: ImagePagerM) -> Bool {
        return lhs.title == rhs.title &&
               lhs.image == rhs.image &&
               lhs.titleColor == rhs.titleColor
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(image)
        hasher.combine(titleColor)
    }
}
