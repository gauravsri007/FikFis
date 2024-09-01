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
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(bgColor)

            VStack(alignment: .leading) {
                Text("Order Summary")
                    .font(.custom_font(.medium,size: 30))
                    .foregroundStyle(.black)
                
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
                .frame(width: appWidth - 40, height: 206)
//                .cardBackground(bgColor: Color.yellow)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
                    HStack{
                        Group{
                            Text("Apply promo code")
                                .font(.custom_font(.medium,size: 14))
                                .foregroundStyle(Color.init(hexa: "CBCBCB"))
                                .padding()

                            
                            Spacer()
                            
                            Text("Apply")
                                .frame(width: 75,height: 50)
                                .background(Color.themeColor)
                                .cornerRadius(10, corners: .allCorners)
                        }
                        
                    }
                    .frame(width: appWidth - 40,height: 50)
                }


            }
            .padding(20)
            .multilineTextAlignment(.center)

        }
        .frame(width: appWidth - 20, height: 383)
        .cardBackground(bgColor: Color.yellow)

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
