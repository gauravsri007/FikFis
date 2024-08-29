//
//  AddressModel.swift
//  FikFis
//
//  Created by apple on 28/08/24.
//

import Foundation

struct Address: Identifiable {
    let id = UUID()
    let userName: String
    let fullAddress: String
    let phoneNumber: String

}


extension Address {
    
    static func all() -> [Address] {
        return [
            Address(userName: "Dummy user", fullAddress: "Full Address: 123 Fake Street, London, Greater London. SW1A 1AA", phoneNumber: "8956231472"),
            Address(userName: "Dummy user", fullAddress: "Full Address: 123 Fake Street, London, Greater London. SW1A 1AA", phoneNumber: "8956231472"),
            Address(userName: "Dummy user", fullAddress: "Full Address: 123 Fake Street, London, Greater London. SW1A 1AA", phoneNumber: "8956231472"),
            Address(userName: "Dummy user", fullAddress: "Full Address: 123 Fake Street, London, Greater London. SW1A 1AA", phoneNumber: "8956231472"),
            Address(userName: "Dummy user", fullAddress: "Full Address: 123 Fake Street, London, Greater London. SW1A 1AA", phoneNumber: "8956231472"),
            Address(userName: "Dummy user", fullAddress: "Full Address: 123 Fake Street, London, Greater London. SW1A 1AA", phoneNumber: "8956231472"),
            Address(userName: "Dummy user", fullAddress: "Full Address: 123 Fake Street, London, Greater London. SW1A 1AA", phoneNumber: "8956231472"),
            Address(userName: "Dummy user", fullAddress: "Full Address: 123 Fake Street, London, Greater London. SW1A 1AA", phoneNumber: "8956231472")
        ]
    }
}
