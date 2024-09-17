//
//  BaseViewModel.swift
//  FikFis
//
//  Created by apple on 17/09/24.
//

import Foundation


class BaseViewModel: ObservableObject {
    // MARK: - TAB BAR
    @Published var currentTab: MyTab = .Home
    
    @Published var homeTab = "Mens T-shirt"
    
    // MARK: - DETAIL VIEW
//    @Published var currentProduct: Product?
    @Published var showDetail = false
}


// MARK: - TAB ITEM CASE
enum MyTab: String {
    case Home = "home"
    case Heart = "heart"
    case ClipBoard = "clipboard"
    case Person = "person"
}
