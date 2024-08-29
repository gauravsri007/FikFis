//
//  Constant.swift
//  FikFis
//
//  Created by apple on 23/08/24.
//

import Foundation
import UIKit
import SwiftUI

let leadingSpace : CGFloat = 5
let leadingSpace_account : CGFloat = 25

let appWidth = UIScreen.main.bounds.width
let appHeight = UIScreen.main.bounds.height
let header_font: CGFloat = 30

struct AppColor {
    static let primaryBlack = Color.init(hexa: "1F1F1F")
    static let secondaryBlack = Color.init(hexa: "464B5F")
    static let lightGrayColor = Color.init(hexa: "F9F9F9")
    static let primaryRed = Color.init(hexa: "CB2D3E")
    static let secondaryRed = Color.init(hexa: "EF473A")
    static let gradientRedHorizontal = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "CB2D3E"), Color.init(hex: "EF473A")]), startPoint: .leading, endPoint: .trailing)
    static let gradientRedVertical = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "CB2D3E"), Color.init(hex: "EF473A")]), startPoint: .bottom, endPoint: .top)
    static let shadowColor = Color.init(hexa: "dddddd")
    static let lightGreen = Color.init(hexa: "e8fbe8")
    static let lightGray = Color.init(hexa: "848484")
    static let themeColor_yellow = Color.init(hexa: "FBB540")

}
