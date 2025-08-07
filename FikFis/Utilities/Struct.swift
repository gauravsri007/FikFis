//
//  Struct.swift
//  FikFis
//
//  Created by apple on 04/08/24.
//

import Foundation
import SwiftUI
import UIKit

struct NavigationBarModifier: ViewModifier {
    
    init(backgroundColor: UIColor = .systemBackground, foregroundColor: UIColor = .blue, tintColor: UIColor?, withSeparator: Bool = true){
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        navBarAppearance.backgroundColor = backgroundColor
        if withSeparator {
            navBarAppearance.shadowColor = .clear
        }
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        if let tintColor = tintColor {
            UINavigationBar.appearance().tintColor = tintColor
        }
    }
    func body(content: Content) -> some View {
        content
    }
}

// MARK: - TOAST
// MARK: -

struct ToastView: View {
    let message: String

    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.8))
            .cornerRadius(10)
            .shadow(radius: 5)
    }
    
 
}

// MARK: - PROFILE
// MARK: -

struct ProfileResponse: Codable {
    let status: Int?
    let error: Int?
    let message: String?
    let user: UserResponse?
}

struct UserResponse: Codable {
    let id: String?
    let first_name: String?
    let last_name: String?
    let status: String?
    let mobile: String?
    let password: String?
    let device_type: String?
    let created_at: String?
    let updated_at: String?
}

public struct ProfileData: Codable{
    public var message : String?
    public var id : String?
    public var first_name : String?
    public var last_name : String?
    public var email : String?
    public var mobile : String?
    public var password : String?
    public var device_type : String?
    public var device_token : String?
    public var fcm_token : String?
    public var status : String?
    public var created_at : String?
    public var updated_at : String?
}

// MARK: - MESSAGE
// MARK: -

public struct MessageData: Codable{
    public var message : String?
    
}
