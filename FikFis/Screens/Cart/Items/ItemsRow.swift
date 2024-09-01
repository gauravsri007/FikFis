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
    var body: some View {
        VStack(alignment: .leading){
            upperView
                .padding([.leading],10)
            
            lowerView
        }
        .frame(width: UIScreen.screenWidth - 20,height: 165)
        .border(Color.init(hex: "D1D1D1"),width: 1)
        .background(Color.clear.cornerRadius(6))
        
    }
    
    var upperView : some View{
        HStack{
            Image("\(product.imageUrl)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipped()
                .cornerRadius(12)
            VStack(alignment: .leading){
                Text(product.productName)
                StarRatingView(rating: .constant(3))
                    .frame(width: 105, height: 15)
                HStack{
                    Text(product.productPrice)
                        .font(.custom_font(.regular,size: 17))
                    Text("£3899")
                        .foregroundStyle(Color.gray)
                        .font(.custom_font(.regular,size: 17))
                    Text(product.ProductDiscount)
                        .foregroundStyle(Color.white)
                        .font(.custom_font(.semiBold,size: 14))
                        .background(Color.init(hex: "DD3333"))
                        .padding([.all],10)
                }
                
            }
            .padding([.bottom])
                
        }
    }
    
    
    var lowerView : some View{
        var height : CGFloat = 30
        return
        VStack(alignment: .leading){
            HStack{
                HStack{
                    Button{
                        
                    }
                label:{
                    Image(systemName: "plus")
                        .foregroundStyle(Color.black)
                    
                }
                    Text("1")
                        .foregroundStyle(Color.black)
                    Button{
                        
                    }
                label:{
                    Image(systemName: "minus")
                        .foregroundStyle(Color.black)
                    
                }
                    
                }
                .frame(width: 100,height: height)
                .border(Color.init(hex: "D1D1D1"))
                .background(content: {
                    RoundedRectangle(cornerRadius: 26)
                        .foregroundColor(Color.clear)
                })
                
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
