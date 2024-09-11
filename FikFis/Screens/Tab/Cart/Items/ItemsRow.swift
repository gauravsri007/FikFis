//
//  ItemsRow.swift
//  FikFis
//
//  Created by apple on 01/09/24.
//

import SwiftUI

struct ItemsRow: View {
    @State var size: CGFloat = 100
    var product:ProductM
    var productCount : Int
    @State var quantity = 1
    var body: some View {
        VStack(alignment: .leading){
            upperView
                .padding([.leading],10)
            
            lowerView
        }
        .frame(width: UIScreen.screenWidth - 20,height: 165)
        .background(RoundedRectangle(cornerRadius: 6).stroke(lineWidth: 1).foregroundStyle(Color.init(hex: "D1D1D1")))
    }
    
    var upperView : some View{
        HStack(alignment: .top) {
            Image("\(product.imageUrl)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipped()
                .cornerRadius(5)
            VStack(alignment: .leading){
                Text(product.productName)
                    .lineLimit(2)
                    .frame(height: size-50)
                HStack {
                    Text("3.0")
                    StarRatingView(rating: .constant(3))
                        .frame(width: 105, height: 15)
                }.frame(height: 14)
                
                HStack{
                    Text(product.productPrice)
                        .font(.custom_font(.regular,size: 17))
                    Text("£3899")
                        .foregroundStyle(Color.gray)
                        .font(.custom_font(.regular,size: 17))
                        .strikethrough()
                    Text(product.ProductDiscount)
                        .foregroundStyle(Color.white)
                        .font(.custom_font(.semiBold,size: 14))
                        .padding(.vertical, 3)
                        .padding(.horizontal, 7)
                        .background(Color.init(hex: "DD3333").cornerRadius(5))
                }
            }.padding(.top, -4)
        }
        .frame(height: size)
    }
    
    var lowerView : some View{
        let height : CGFloat = 30
        return VStack(alignment: .leading){
            HStack{
//                Stepper("\(quantity)", value: $quantity, in: 1...50)
//                    .fixedSize()
                HStack{
                    Button{
                        if quantity < 100 {
                            quantity += 1
                        }
                    } label:{
                        Image(systemName: "plus")
                            .foregroundStyle(Color.black)
                        
                    }
                    Text("\(quantity)")
                        .foregroundStyle(Color.black)
                    Button{
                        if quantity > 0 {
                            quantity -= 1
                        }
                    } label:{
                        Image(systemName: "minus")
                            .foregroundStyle(Color.black)
                        
                    }
                }
                .padding(.vertical, 5)
                .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).foregroundStyle(Color.init(hex: "D1D1D1")))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("share")
                }
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .background {
                    Color.themeColor
                }
                .clipShape(Circle())
                
                Button {
                    
                } label: {
                    Image("delete")
                }
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .background {
                    Color.themeColor
                }
                .clipShape(Circle())
                .padding([.trailing],10)
            }
            
        }
        .padding([.leading],10)
    }
    
}

#Preview {
    ItemsRow(product: ProductM(id: 0, productRating: 3, productName: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage)", productPrice: "£399", imageUrl: "product", ProductDiscount: "47% Off"),productCount: 1)
}
