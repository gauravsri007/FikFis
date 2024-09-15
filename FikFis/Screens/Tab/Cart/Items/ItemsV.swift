//
//  ItemsV.swift
//  FikFis
//
//  Created by apple on 01/09/24.
//

import SwiftUI

fileprivate func ContinueButton() -> some View {
    NavigationLink(destination: ShippingV(orderSummary:OrderSummaryModel(items_total: 2000.0, items_discount: 100.0, delivery: 10.0, tax: 10.0) )){

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


struct ItemsV: View {
    var orderSummary = OrderSummaryModel.value()
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
        .padding().ignoresSafeArea()
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
            .frame(width: appWidth - 80,height: 150,alignment: .center)
            .padding([.horizontal,.vertical],10)
            .background(Color.white.cornerRadius(10, corners: .allCorners))
            .padding(10)
            .cardViewStyle()
            
            Spacer()
            
            HStack{
                Text("Apply promo code")
                    .font(.custom_font(.medium,size: 14))
                    .foregroundStyle(Color.init(hexa: "CBCBCB"))
                    .padding()
                Spacer()
                Text("Apply")
                    .frame(width: 75,height: 40)
                    .background(Color.themeColor)
                    .cornerRadius(buttonCornerRadius, corners: .allCorners)
                    .padding(5)
            }
            .frame(width: appWidth - 40,height: 50)
            .background(Color.white.cornerRadius(buttonCornerRadius, corners: .allCorners))
            .padding(.bottom)
            
            VStack{
                HStack{
//                    Spacer()
                    NavigationLink(destination: App_offersV()){
                        Text("View Offers")
                            .foregroundStyle(Color.init(hex: "008224"))
                        Image(systemName: "arrow.forward")
                            .frame(width: 2, height: 2)
                            .foregroundStyle(.white)
                            .padding()
                            .background {
                                Color.themeColor
                            }
                            .clipShape(Circle())
                    }
                }
                .padding([.bottom,.trailing])
            }

        }
        .multilineTextAlignment(.center)
        .frame(width: appWidth - 20,height: 400)
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
    ItemsV(orderSummary:OrderSummaryModel(items_total: 2000.0, items_discount: 100.0, delivery: 10.0, tax: 10.0) )
}


