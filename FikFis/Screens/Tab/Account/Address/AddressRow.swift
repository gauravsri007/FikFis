//
//  AddressRow.swift
//  FikFis
//
//  Created by apple on 28/08/24.
//

import SwiftUI

struct AddressRow: View {
    var address: Address

    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 10)
            Text(address.userName)
                .font(.custom_font(.bold,size: 16))
                .foregroundColor(AppColor.secondaryBlack)
            
            Spacer().frame(height: 10)

            Text("Full Addreess : \(address.fullAddress)")
                .font(.custom_font(.medium,size: 15))
                .foregroundColor(AppColor.secondaryBlack)
            
            Spacer().frame(height: 10)

            Text("Phone Number : \(address.phoneNumber)")
                .font(.custom_font(.medium,size: 15))
                .foregroundColor(AppColor.secondaryBlack)
            
            HStack{
                Button(action: {
                }) {
                    Text("Edit")
                        .font(.custom_font(.regular,size: 12))
                }
                .foregroundColor(AppColor.lightGray)
                Text("|")
                    .foregroundColor(AppColor.lightGray)
                Button(action: {
                    
                }) {
                    Text("Remove")
                        .font(.custom_font(.regular,size: 12))
                }
                .foregroundColor(AppColor.lightGray)
                Text("|")
                    .foregroundColor(AppColor.lightGray)
                Button(action: {
                }) {
                    Text("Set as default")
                        .font(.custom_font(.semiBold,size: 12))
                }
                .foregroundColor(AppColor.themeColor_yellow)
            }
            .padding(.vertical)

        }
        .padding(.horizontal, 6)
        .border(Color.gray)
        .frame(width: appWidth / 2 - 16, height: 200)
//        .padding()
        
//        .clipped()
    }
}

#Preview {
    AddressRow(address: Address(userName: "Mr. John Smith", fullAddress: "Full Address: 123 Fake Street, London, Greater London. SW1A 1AA", phoneNumber:"8956231472"))
}
