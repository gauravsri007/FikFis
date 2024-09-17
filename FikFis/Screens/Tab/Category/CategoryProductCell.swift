//
//  CategoryProductV.swift
//  FikFis
//
//  Created by apple on 16/09/24.
//

import SwiftUI

struct CategoryProductCell: View {
    let item : ProducCategoryModel
    @State var isFavorite: Bool = false
    
    fileprivate func FavoriteButton() -> some View {
        return Button(action: {
            print("Name: \(self.item.name)")
            isFavorite.toggle()
        }) {
            Image(systemName: isFavorite == true ? "heart.fill" : "heart")
                .foregroundColor(isFavorite == true ? .red :.gray)
                .frame(width: 30, height: 30)
                .background(Color.white)
            
        }
        .cornerRadius(20)
        .opacity(0.9)
        .shadow(color: Color.init(hex: "dddddd"), radius: 0.5, x: 0.3, y: 0.3)
    }
    
    var body: some View {
        ZStack{
            NavigationLink(destination:             ProductDetailV(coverImages: [
                ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} ),
                ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} ),
                ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} ),
                ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} ),
                ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} ),
                ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} )],
                                                                   product: CommonModel(id: 0, title: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage, 8GB RAM, 12GB RAM)", image: "",rating: "3.5",discount:"47", reviewCount: 150),arrProductImages: arrImages_static)){
                VStack(alignment: .leading) {
                    Image("\(item.imageUrl)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: (appWidth/2) - 30, height: (appWidth/2) - 30)
                        .cornerRadius(2)
                        .clipped()
                        .overlay(
                            self.FavoriteButton()
                                .padding([.top, .trailing], 5)
                            , alignment: .topTrailing
                        )
                    
                    Text(item.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(width: (appWidth/2) - 30, height: 50)
                        .font(.custom_font(.regular, size: 12))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .padding([.leading],0)
                    
                    
                    
                    HStack {
                        Text("$105100"+"   ").font(.custom_font(.semiBold, size: 10)) + Text("$105100").foregroundStyle(Color.init(hex: "#727272"))
                            .font(.custom_font(.semiBold, size: 10)).strikethrough()
                        
                        Spacer()
                        
                        Text("\(item.discount )% Off")
                            .font(.custom_font(.semiBold, size: 10))
                            .bold()
                            .foregroundStyle(.white)
                            .padding(2)
                            .background {
                                Color.init(hex: "DD3333").cornerRadius(5)
                            }
                    }
                    
                    HStack{
                        StarRatingView(rating: .constant(3))
                            .frame(width: 80, height: 12)
                        Spacer()
                        Button{}label: {
                            Text("Add")
                                .font(.custom_font(.medium, size: 10))
                                .foregroundStyle(Color.black)
                                .padding([.horizontal])
                                .padding([.vertical],4)
                                .background(content: {
                                    RoundedRectangle(cornerRadius: 26)
                                        .foregroundColor(Color.theme)
                                })
                        }
                    }
                    
                    
                }
                .frame(width: (appWidth / 2) - 30)
                .padding(.top, 8)
                .padding(.bottom, 10)
                .padding(.horizontal, 5)
                .cardViewStyle()
                //        .padding(.top, 2)
                //        .padding(.bottom, 12)
                //        .onTapGesture {
            }
        }
    }
}

#Preview {
    CategoryProductCell(item: ProducCategoryModel(name: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage)", imageUrl: "product1",discount: "3899",price: "399", isFavorite: true))
}
