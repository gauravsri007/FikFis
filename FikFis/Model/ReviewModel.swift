//
//  ReviewModel.swift
//  FikFis
//
//  Created by apple on 01/09/24.
//

import Foundation

struct Review: Identifiable {
    let id = UUID()
    let profile: String
    let userName: String
    let description: String
}
