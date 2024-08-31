//
//  NoInternetV.swift
//  FikFis
//
//  Created by apple on 31/08/24.
//

import SwiftUI

struct NoInternetV: View {
    var body: some View {
        VStack{
            Text("Oops!!!")
        }
        .font(.custom_font(.medium,size: 40))
        .foregroundColor(Color.themeColor)
        Image("no_internet")
            .padding()
        
        Text("please check your internet connection and try again")
            .font(.custom_font(.regular,size: 16))
            .foregroundColor(Color.init(hexa: "666666"))
            .multilineTextAlignment(.center)

    }
}

#Preview {
    NoInternetV()
}
