//
//  ProductDescriptionV.swift
//  FikFis
//
//  Created by apple on 10/09/24.
//

import SwiftUI

struct ProductDescriptionV: View {
    @State var arrRecentView = Card.row()
    @State var arrAppliance = Card.row2()

    
    var body: some View {
        VStack(alignment: .leading ){
            
                textSection
  
        }

    }
    
    var textSection: some View {
        Text("DIMENSIONS & CONTENTS: - One Elastic Fitted King Size Bedsheet with 2 Standard Size Pillow Covers.1 Double King Size Elastic Fitted Bedsheets Fits for 78 x 72 x 8 inches / 198 x 182 Cms / 6½ x 6 feet, Fits up to mattress thickness of 8 to 10 inch. Pillow Cover Size: Standard size 28 x 18 Inches. This fitted bedsheet is perfect for use in a home, hotel or ideal for any bedroom style.No more tucking of Bedsheets every morning. All-around elastic to pull in the borders to make it easily stretch and fit the base of the mattress.our fitted bedsheet features deep pockets and elasticized edges, ensuring a secure fit that stays in place throughout the night.")
            .font(.custom_font(.regular, size: 15))
            .padding(10)
            .frame(height: 300)
    }
    
    var recentViewedSection: some View {
        VStack{
            HStack {
                Text("Recent Viewed")
                    .font(.custom_font(.medium, size: 17))
                Spacer()
                ForwardButton(imageName: "arrow.forward", size: 2)
            }
            .padding([.top, .horizontal])
            
            productItemCollectionSection
        }
    }
    
    var productItemCollectionSection: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [
                    GridItem(.flexible(), alignment: .top),
                    GridItem(.flexible(), alignment: .top)
                ], content: {
                    ForEach(arrRecentView) { collection in
                        ProductItem(item: collection)
                    }
                })
            }
            .padding([.horizontal], 8)
            .scrollDisabled(false)
        }
        .frame(width: appWidth - 10,height: 340)
    }
    
    
    var appliancesSection: some View {
        VStack {
            HStack {
                Text("Home Appliances Up to 55% off")
                    .font(.custom_font(.medium, size: 17))
                Spacer()
                ForwardButton(imageName: "arrow.forward", size: 2)
            }
            .padding(.top)
            .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [
                    GridItem(.flexible(), alignment: .top),
                    GridItem(.flexible(), alignment: .top)
                ]) {
                    ForEach(arrAppliance) { collection in
                        FrameView(item: collection)
                    }
                }
                .padding(.horizontal, 10)
            }
            
            HStack {
                Button {
                    
                } label: {
                    Text("Explore Now")
                        .font(.custom_font(.semiBold, size: 12))
                        .foregroundStyle(.black)
                }
                .padding(8)
                .padding(.horizontal)
                .background {
                    Color.themeColor.cornerRadius(30)
                }
                Spacer()
            }
            .padding(.leading)
            .padding(.bottom)
            
        }
        .cardViewStyle()
        .padding(.horizontal)
    }
}

#Preview {
    ProductDescriptionV()
}
