//
//  PaymentV.swift
//  FikFis
//
//  Created by apple on 01/09/24.
//

import SwiftUI

fileprivate func ContinueButton() -> some View {
    NavigationLink(destination: ConfirmationV()){
        Text("Checkout")
            .font(.custom_font(.medium,size: 20))
            .foregroundColor(.black)
            .frame(height: 50)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.themeColor)
            .cornerRadius(25)
    }
    .padding([.horizontal,.bottom], 10)
}

struct PaymentV: View {
    var orderSummary_card = OrderSummaryModel.value()

    var arrCartList = ProductM.all()
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                orderSummarySection
                
                payOnline
                
                ContinueButton()
            
                FikfisCommitment
                
                availableOffer
            }
        }
        .padding()
        .scrollIndicators(.hidden)
    }
    
    
    var payOnline:some View{
        HStack{
            Button{
                
            }label:{
                Image(systemName: "circle.circle.fill")
                    .foregroundColor(.themeColor)
            }
            Text("Pay online")
                .font(.custom_font(.regular,size: 16))
        }
        .padding(.vertical)
    }
    
    var orderSummarySection: some View{
        
        VStack(alignment: .leading) {
            Text("Order Summary")
                .font(.custom_font(.medium,size: 24))
                .foregroundStyle(.black)
                .padding(.horizontal)
            
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 1, y: 1)
                
                VStack(alignment: .leading) {
                    HStack{
                        Text("Item(s) total:")
                            .font(.custom_font(.medium,size: 16))
                            .foregroundStyle(.black)
                        Spacer()
                        
                        Text("£\(orderSummary_card.items_total)")
                        
                    }
                    
                    HStack{
                        Text("Item(s) discount:")
                            .font(.custom_font(.medium,size: 16))
                            .foregroundStyle(.black)
                        Spacer()
                        
                        Text("£\(orderSummary_card.items_total)")
                    }
                    HStack{
                        Text("Delivery:")
                            .font(.custom_font(.medium,size: 16))
                            .foregroundStyle(.black)
                        Spacer()
                        
                        Text("£\(orderSummary_card.items_total)")
                    }
                    
                    HStack{
                        Text("Tax:")
                            .font(.custom_font(.medium,size: 16))
                            .foregroundStyle(.black)
                        Spacer()
                        
                        Text("£\(orderSummary_card.items_total)")
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Total")
                            .font(.custom_font(.medium,size: 16))
                            .foregroundStyle(.black)
                        Spacer()
                        
                        Text("£\(orderSummary_card.items_total)")
                    }
                }
                .padding(20)
                .multilineTextAlignment(.center)
            }
            .padding([.horizontal])
            .padding([.bottom])

            
        }
        .frame(width: appWidth - 20,height: 250,alignment: .leading)
        .background(Color.init(hex: "F6F6F6").cornerRadius(5, corners: .allCorners))
    }
    

    var ListView:some View{
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(arrCartList) { wishList in
                ItemsRow(product: wishList, productCount: 1)
            }
        }
    }
    
    
}

#Preview {
    PaymentV()
}
