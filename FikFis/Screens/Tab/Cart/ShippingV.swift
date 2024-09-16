//
//  ShippingV.swift
//  FikFis
//
//  Created by apple on 01/09/24.
//

import SwiftUI

fileprivate func ContinueButton() -> some View {
        NavigationLink(destination: PaymentV()){
        Text("Continue")
            .font(.custom_font(.medium,size: 20))
            .foregroundColor(.black)
            .frame(height: 50)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.themeColor)
            .cornerRadius(25)
    }
        .padding([.horizontal,.bottom], 10)
}

struct ShippingV: View {
    var orderSummary : OrderSummaryModel
    var arrCartList = ProductM.all()
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ListView
                Spacer()
                
                orderSummarySection
                
                ContinueButton()
                
                FikfisCommitment
                
                availableOffer
                
            }
        }
        .padding()
        .scrollIndicators(.hidden)

    }
    
    
    
    var orderSummarySection : some View{
        VStack(alignment: .leading) {
            Text("Order Summary")
                .font(.custom_font(.medium,size: 24))
                .foregroundStyle(.black)
                .padding([.top])
                
            VStack(alignment: .leading) {
                HStack{
                    Text("Item(s) total:")
                        .font(.custom_font(.medium,size: 16))
                        .foregroundStyle(.black)
                    Spacer()
                    
                    Text("£\(orderSummary.items_total)")
                }
                
                HStack{
                    Text("Item(s) discount:")
                        .font(.custom_font(.medium,size: 16))
                        .foregroundStyle(.black)
                    Spacer()
                    
                    Text("£\(orderSummary.items_total)")
                }
                HStack{
                    Text("Delivery:")
                        .font(.custom_font(.medium,size: 16))
                        .foregroundStyle(.black)
                    Spacer()
                    
                    Text("£\(orderSummary.items_total)")
                }
                
                HStack{
                    Text("Tax:")
                        .font(.custom_font(.medium,size: 16))
                        .foregroundStyle(.black)
                    Spacer()
                    
                    Text("£\(orderSummary.items_total)")
                }
                
                Divider()
                
                HStack{
                    Text("Total")
                        .font(.custom_font(.medium,size: 16))
                        .foregroundStyle(.black)
                    Spacer()
                    
                    Text("£\(orderSummary.items_total)")
                        .bold()
                }
            }
            .multilineTextAlignment(.center)
            .frame(width: appWidth - 80)
            .background(Color.white.cornerRadius(10, corners: .allCorners))
            .padding([.horizontal,.vertical,.bottom],10)
            .padding(10)
            .cardViewStyle()
            .padding(.bottom)
            
        }
        .multilineTextAlignment(.center)
        .frame(width: appWidth - 20)
        .background(Color.init(hex: "EAEAEA").cornerRadius(8, corners: .allCorners))
        .padding(.bottom)
        
    }

    var ListView:some View{
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(arrCartList) { wishList in
                ItemsRow(product: wishList, productCount: 1)
            }
        }
        .padding([.vertical],10)
    }

    
}

#Preview {
    ShippingV(orderSummary:OrderSummaryModel(items_total: 2000.0, items_discount: 100.0, delivery: 10.0, tax: 10.0) )
}
