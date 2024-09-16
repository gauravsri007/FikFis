//
//  ConfirmationV.swift
//  FikFis
//
//  Created by apple on 01/09/24.
//

import SwiftUI

struct ConfirmationV: View {
    var orderNumber = "#SC124535"
    @Environment(\.dismiss) var dismiss

    fileprivate func SubmitButton() -> some View {
        Button{
            dismiss()
        }label: {
                  Text("CONTINUE SHOPPING")
                .font(.custom_font(.medium,size: 20))
                .foregroundColor(.black)
                .frame(height: 50)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.themeColor)
                .cornerRadius(25)
        }
        .padding(.horizontal, 10)
    //    .padding(.vertical, 10)
    }
    
    var body: some View {
        VStack{
            Text("THANK YOU")
                .font(.custom_font(.bold,size: 40))
                .foregroundStyle(Color.themeColor)
            
            Text("for your order")
                .font(.custom_font(.regular,size: 15))
                .foregroundStyle(Color.black)
            
            Image("confirmation")
                .padding([.vertical],20)

            
            Text("TRACK YOUR ORDER")
                .font(.custom_font(.bold,size: 20))
                .foregroundStyle(Color.init(hexa: "008224"))
            Text("ORDER NUMBER \(orderNumber)")
                .font(.custom_font(.regular,size: 15))
                .foregroundStyle(Color.black)

            
            SubmitButton()
                .padding([.top],20)
            

        }
    }
}

#Preview {
    ConfirmationV()
}
