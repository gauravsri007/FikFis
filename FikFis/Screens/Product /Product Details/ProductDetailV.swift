//
//  ProductDetailV.swift
//  FikFis
//
//  Created by apple on 08/09/24.
//

import SwiftUI

struct ProductDetailV: View {
    let coverImages: [ImagePagerM]
    let product : CommonModel
    let arrProductImages : [String]
    var arrSize = ["S", "M", "L", "XL", "XXL"]
    @State private var size: String = ""

    fileprivate func plusButton() -> some View {
        return Button(action: {}) {
            Image(systemName: "plus")
                .foregroundColor(.gray)
                .frame(width: 25, height: 25)
        }
    }
    
    fileprivate func minusButton() -> some View {
        return Button(action: {}) {
            Image(systemName: "minus")
                .foregroundColor(.gray)
                .frame(width: 25, height: 25)
        }
    }
    

    var body: some View {
//        NavigationHeader(isBellIconHidden: false)

            VStack(alignment: .leading ){
                
                ScrollView{

                coverImageSection
                
                productDtls
         
                productImages
                
                selectSizeView
                
                estimatedDelivery
                
                paymentMode
                
                textSection
                
                AdditionalInformationV()

                VerifiedReviewsV()
                
            }
        }
        .padding([.horizontal],10)


    }
    
    var textSection: some View {
        VStack(alignment: .leading ){
            
            Text("DIMENSIONS & CONTENTS: - One Elastic Fitted King Size Bedsheet with 2 Standard Size Pillow Covers.1 Double King Size Elastic Fitted Bedsheets Fits for 78 x 72 x 8 inches / 198 x 182 Cms / 6½ x 6 feet, Fits up to mattress thickness of 8 to 10 inch. Pillow Cover Size: Standard size 28 x 18 Inches. This fitted bedsheet is perfect for use in a home, hotel or ideal for any bedroom style.No more tucking of Bedsheets every morning. All-around elastic to pull in the borders to make it easily stretch and fit the base of the mattress.our fitted bedsheet features deep pockets and elasticized edges, ensuring a secure fit that stays in place throughout the night.")
                .font(.custom_font(.regular, size: 15))
                .padding(10)
                .frame(height: 300)
        }
        .padding([.horizontal])

    }
    
    var productDtls : some View{
        
        VStack(alignment: .leading ){
            
            Text(product.title)
            
            HStack {
                
                Text(product.rating ?? "")
                    .font(.custom_font(.semiBold, size: 12))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(5)
                    .background {
                        Color.init(hex: "FFB545").cornerRadius(5)
                    }
                StarRatingView(rating: .constant(3) )
                    .frame(width: 105, height: 15)
                let reviewCount : Int = product.reviewCount ?? 0
                Text("\(reviewCount)")
                    .font(.custom_font(.semiBold, size: 15))
                    .foregroundStyle(Color.init(hex: "4C4C4C"))
            }
            
            HStack {
                
                Text("$105100"+"   ").font(.custom_font(.semiBold, size: 14)) + Text("$105100").foregroundStyle(Color.init(hex: "#727272")).font(.custom_font(.semiBold, size: 14)).strikethrough()
                
                Text("\(product.discount ?? "")% Off")
                    .font(.custom_font(.semiBold, size: 12))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(5)
                    .background {
                        Color.init(hex: "DD3333").cornerRadius(5)
                    }
            }
            
            stepperView
            
            Text("Only 100 in stock  |  500K bought ")
                .foregroundStyle(Color.init(hex: "008224"))
                .font(.custom_font(.regular, size: 15))
                .padding([.bottom],10)
        }
        .padding([.horizontal])
        
    }
    
    var stepperView : some View{
        HStack {
            minusButton()
            Text("1")
                .font(.custom_font(.medium, size: 16))
                .foregroundColor(Color.black)
                .padding(.horizontal, 5)
            plusButton()
        }
        .background(AppColor.lightGrayColor)
        .cornerRadius(5)
        .padding(.bottom, 10)
    }
 
    
    var selectSizeView: some View {
        VStack(alignment: .leading) {
           Text("Select Size")
               .foregroundColor(AppColor.secondaryBlack)
           
           HStack {
               ForEach(self.arrSize, id: \.self) { size in
                   Button(action: {
                       self.size = size
                   }) {
                       Text(size)
                           .foregroundColor(self.size == size ? AppColor.secondaryRed : AppColor.secondaryBlack)
                           .frame(width: 32, height: 30)
                   }
                   .overlay(RoundedRectangle(cornerRadius: 5)
                   .stroke(self.size == size ? AppColor.secondaryRed : AppColor.secondaryBlack, lineWidth: self.size == size ? 1.0 : 0.3))
               }
           }

       }
       .padding([.horizontal])
       .frame(width: appWidth, height: 60, alignment: .leading)

   }

    

    
    var estimatedDelivery : some View{
        VStack(alignment: .leading) {
            Text("Estimated Delivery")
                .font(.custom_font(.medium, size: 20))
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
            
            Text("Tuesday, Jul 16 – Saturday, Jul 20")
                .font(.custom_font(.regular, size: 15))
                .foregroundColor(Color.init(hex: "515151"))
                .padding(.horizontal, 10)
            
            Text("Free Delivery")
                .font(.custom_font(.regular, size: 15))
                .foregroundColor(Color.init(hex: "DD3333"))
                .padding(.leading, 10)
        }
        .frame(width: appWidth - 20,height: 93,alignment: .leading)
        .background(Color.init(hex: "F6F6F6").cornerRadius(5, corners: .allCorners))
//        .padding([.leading],10)
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
        .padding([.horizontal])
    }
    
    
    var paymentMode: some View {
        HStack{
            //-------------- COD ---------------
            VStack{
                Button {
                    print("Image tapped!")
                } label: {
                    Image("cod")
                }
                Text("Pay on Delivery")
                    .font(.custom_font(.regular,size: 10))
            }
            .frame(width: (appWidth / 4) - 10,height: 60)
            
            //-------------- Free Delivery ---------------
            VStack{
                Button {
                    print("Image tapped!")
                } label: {
                    Image("freeDelivery")
                }
                
                Text("Free Delivery")
                    .font(.custom_font(.regular,size: 10))
            }
            .frame(width: (appWidth / 4) - 10,height: 60)
            //-------------- Return & Exchange ---------------
            VStack{
                Button {
                    print("Image tapped!")
                } label: {
                    Image("returnExchnge")
                }
                Text("Return & Exchange")
                    .font(.custom_font(.regular,size: 10))
            }
            .frame(width: (appWidth / 4) - 10,height: 60)
            
            //-------------- Guaranteed ---------------
            VStack{
                Button {
                    print(" tapped!")
                } label: {
                    Image("gurantee")
                }
                Text("Guaranteed")
                    .font(.custom_font(.regular,size: 10))
            }
            .frame(width: (appWidth / 4) - 10,height: 60)
            
        }
        .padding([.vertical],10)

    }
    
    
    var coverImageSection: some View {
        TabView {
            ForEach(coverImages,id: \.self) { item in
                Image(uiImage: item.image ?? UIImage())
                    .resizable()
                    .padding(.horizontal)
                    .aspectRatio(contentMode: .fill)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)
            
        )
    
        .frame(height: 320)
    }

   
    
}

#Preview {
    ProductDetailV(coverImages: [
        ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} ),
        ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} ),
        ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} ),
        ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} ),
        ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} ),
        ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} )], 
                   product: CommonModel(id: 0, title: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage, 8GB RAM, 12GB RAM)", image: "",rating: "3.5",discount:"47", reviewCount: 150),arrProductImages: ["product1","product2","product3","product1","product2","product3"])
}
