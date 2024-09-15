//
//  CardView.swift
//  FikFis
//
//  Created by apple on 01/09/24.
//

import SwiftUI

struct CardView: View {
    var orderSummary_card = OrderSummaryModel.value()
    var bgColor : Color
    var body: some View {
        VStack(alignment: .leading) {
            Text("Order Summary")
                .font(.custom_font(.medium,size: 24))
                .foregroundStyle(.black)
                .padding(.top)
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
            .multilineTextAlignment(.center)
            .frame(width: appWidth - 80,height: 150)
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
            
        }
        .multilineTextAlignment(.center)
        .frame(width: appWidth - 20,height: 360)
        .background(Color.init(hex: "EAEAEA"))
        
    }


}


#Preview {
    CardView(orderSummary_card: OrderSummaryModel(items_total: 2000.0, items_discount: 100.0, delivery: 10.0, tax: 10.0), bgColor: Color.init(hexa: "EAEAEA"))
}


struct OrderSummaryModel: Identifiable {
    var id = UUID()
    var items_total,items_discount,delivery,tax : Double
    }

extension OrderSummaryModel{
    static func value()->OrderSummaryModel{
        return OrderSummaryModel(items_total: 2000.0, items_discount: 100.0, delivery: 10.0, tax: 10.0)
    }
}
