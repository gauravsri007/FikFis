//
//  ItemsV.swift
//  FikFis
//
//  Created by apple on 01/09/24.
//

import SwiftUI

fileprivate func SubmitButton() -> some View {
    Button(action: {
        
    }) {
        Text("Continue")
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


struct ItemsV: View {
    var orderSummary : OrderSummaryModel
    var arrCartList = ProductM.all()
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ListView
                    .padding([.vertical],10)
                Spacer()
                
                CardView(orderSummary_card: orderSummary, bgColor: Color.init(hexa: "EAEAEA"))
                
                SubmitButton()
                
                FikfisCommitment
                
            }
        }
        .padding().ignoresSafeArea()
    }
    

    var ListView:some View{
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(arrCartList) { wishList in
                ItemsRow(product: wishList, productCount: 1)
            }
        }
    }
    
    var FikfisCommitment:some View{
        ZStack{
            Rectangle()
                .cornerRadius(10, corners: .allCorners)
//                .background(Color.yellow)
            
            VStack{
                Text("FikFis Commitments")
            }
        }
        .frame(width: appWidth - 20,height: 207)
    }
    
    var availbleOffers:some View{
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(arrCartList) { cartList in
                Product_wishList(product: cartList, productCount: 1)
            }
        }
    }
    
}

#Preview {
    ItemsV(orderSummary:OrderSummaryModel(items_total: 2000, items_discount: 100, delivery: 10, tax: 10) )
}


