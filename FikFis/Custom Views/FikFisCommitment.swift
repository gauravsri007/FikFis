//
//  FikFisCommitment.swift
//  FikFis
//
//  Created by apple on 15/09/24.
//

import Foundation
import SwiftUI



var FikfisCommitment:some View{
    VStack(alignment: .leading){
        Text("FikFis Commitments")
            .font(.custom_font(.medium,size: 20))
            .padding([.horizontal,.top], 10)
        HStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 4,height: 4)
                .padding([.leading])

            Text("Safe payments")
                .font(.custom_font(.regular,size: 16))
        }
        HStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 4,height: 4)
                .padding([.leading])
            Text("Secure privacy")
                .font(.custom_font(.regular,size: 16))
        }
        HStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 4,height: 4)
                .padding([.leading])
            Text("15-day no update refund")
                .font(.custom_font(.regular,size: 16))
        }
        HStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 4,height: 4)
                .padding([.leading])
            Text("Return if item damaged")
                .font(.custom_font(.regular,size: 16))
        }
        HStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 4,height: 4)
                .padding([.leading])
            Text("20-day no delivery refund")
                .font(.custom_font(.regular,size: 16))
        }
        HStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 4,height: 4)
                .padding([.leading])
            Text("24 x 7 Support")
                .font(.custom_font(.regular,size: 16))
        }
        Spacer()
    }
    .frame(width: appWidth - 20,alignment: .leading)
    .background(Color.init(hex: "FCCA7F").cornerRadius(5, corners: .allCorners))
    .padding(.bottom)
}



var availableOffer:some View{
    VStack(alignment: .leading){
        Text("Available offers")
            .font(.custom_font(.medium,size: 20))
            .padding(.horizontal, 10)
            .padding([.horizontal,.top], 10)
        HStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 4,height: 4)
                .padding([.leading])
            Text("Get 5% Instant Discount on first on order of £200 and above ")
                .font(.custom_font(.regular,size: 16))
        }

        HStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 4,height: 4)
                .padding([.leading])
            Text("Get 5% Instant Discount on first on order of £200 and above")
                .font(.custom_font(.regular,size: 16))
        }
        HStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 4,height: 4)
                .padding([.leading])
            Text("Get 5% Instant Discount on first on order of £200 and above")
                .font(.custom_font(.regular,size: 16))
            Spacer()
        }
    }
    .frame(width: appWidth - 20,height: 240,alignment: .leading)
    .background(Color.init(hex: "F6F6F6").cornerRadius(5, corners: .allCorners))
    .padding(.bottom, 100)
}
