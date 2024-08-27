//
//  ReviewsCell.swift
//  FikFis
//
//  Created by apple on 26/08/24.
//
//Added
import SwiftUI

struct ReviewsCell: View {
    @State var size: CGFloat = 100
    var arrImages : [String]
    var productReview:ProductReviewsM
    var productCount : Int
    var body: some View {
        VStack(alignment: .leading){
            upperView
                .padding([.leading],10)
            Text(productReview.review)
                .lineLimit(nil)
                .padding([.leading])
            
            reviewedImages

        }
        .frame(width: UIScreen.screenWidth - 20,height: 240)
        .border(Color.init(hex: "D1D1D1"),width: 1)
        .background(Color.clear.cornerRadius(6))
        
    }
    
    var upperView : some View{
        HStack{
            Image("\(productReview.imageUrl)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipped()
                .cornerRadius(12)
            VStack(alignment: .leading){
                Text(productReview.productName)
                    .lineLimit(nil)
                
                HStack{
     
                    Text("ORDER #")
                        .foregroundStyle(Color.gray)
                        .font(.custom_font(.regular,size: 17))
                    Text(productReview.orderNumber)
                        .foregroundStyle(Color.gray)
                        .font(.custom_font(.regular,size: 17))

                }
                
                StarRatingView(rating: .constant(3))
                    .frame(width: 105, height: 15)
                
            }
            .padding([.bottom])
                
        }
    }
    
    
    var reviewedImages: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(arrImages,id: \.self) { image in
                    Image(image)
                        .resizable()
                        .frame(width: 54,height: 54)
                }
            }
        }
        .frame(height: 54)
        .padding()
    }
    
}

#Preview {
    ReviewsCell(arrImages: ["product","product","product","product","product","product","product","product"], productReview: ProductReviewsM(id: 0, productRating: 2, productName: "POCO M6 5G (Orion Blue, 8GB RAM, 256GB Storage)", orderNumber: "33435333R", imageUrl: "product", review: "Aku cobain produk ini masih jaman sekolah, karna gak tau apa produk yg bagus. Dan alhamdulillah ini ", reviewImages: ["product","product","product","product","product","product","product","product"]), productCount: 1)
}
