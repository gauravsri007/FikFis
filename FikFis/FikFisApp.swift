//
//  FikFisApp.swift
//  FikFis
//
//  Created by apple on 31/07/24.
//
//

import SwiftUI

@main
struct FikFisApp: App {
    var body: some Scene {
        WindowGroup {
//            SignUpV()
//            HomeV(coverImages: [ImagePagerM(image: UIImage(named: "paging1"), title: "1", titleColor: .red, action: {} ),ImagePagerM(image: UIImage(named: "paging2"), title: "1", titleColor: .red, action: {} )])
            TabV()
        }
    }
}
