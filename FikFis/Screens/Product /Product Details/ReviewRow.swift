//
//  ReviewRow.swift
//  FikFis
//
//  Created by apple on 12/09/24.
//

import SwiftUI

struct ReviewRow: View {
    let arrProductImages : [String]

    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                NavigationLink(destination: EmptyView()) {
                    
                    Image("product")
                    //                    .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.custom_font(.regular,size: 18))
                        .aspectRatio(contentMode: .fill)
                        .padding()
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                .cornerRadius(25)
                
                Text("Recent Viewed")
                    .font(.custom_font(.medium, size: 17))

            }
            
            HStack{
                
                StarRatingView(rating:.constant(4))
                    .frame(width: 105, height: 15)
                
                Text("Techno pova 5 pro")
                    .font(.custom_font(.medium, size: 17))
                
            }
            
            Text("Aku cocok menggunakan produk night cream white secret dari wardah ini. Buat kulit wajahku terasa lem")
                .font(.custom_font(.regular, size: 16))
            
            productImages
                .padding(.bottom)
            
            Divider()
            
        }
        .padding([.horizontal],10)
    }
    
    var productImages: some View {
        VStack(alignment: .leading ){
            Text("Color: Black")
                .foregroundStyle(Color.init(hex: "303030"))
                .font(.custom_font(.medium, size: 16))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(arrProductImages,id: \.self) { image in
                        Image(image)
                            .resizable()
                            .frame(width: 54,height: 54)
                    }
                }
            }
            .frame(height: 54)
        }
    }
    
}

#Preview {
    ReviewRow(arrProductImages: arrImages_static)
}
