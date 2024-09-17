//
//  ProductCategoryList.swift
//  FikFis
//
//  Created by apple on 17/09/24.
//

import SwiftUI

struct ProductCategoryList: View {
    //MARK: - GEOMETRY EFFECT
    @Namespace var animation
    @StateObject var baseData = BaseViewModel()
    @State var arrCategoryProduct = ProducCategoryModel.all()

    
    var body: some View {
        VStack(alignment: .leading){
//            NavigationHeader(isBellIconHidden: false)
            NavigationHeader_filter(navHeader: "Category", isRightBarItemHidden: false)

            itemTab
            
            productItemCollectionSection
        }
    }
    
    var itemTab: some View {
        
        HStack{
            //MARK: - CATEGORY LIST SLIDER
            ScrollView(.horizontal, showsIndicators: false) {
                //MARK: - CATEGORY LIST
                HStack(spacing: 18) {
                    CategoryItem(image: "product1", title: "Mens T-shirt")
                    
                    CategoryItem(image: "product1", title: "Mens shoes")
                    
                    CategoryItem(image: "product1", title: "Health Care")
                    
                    CategoryItem(image: "product1", title: "Backpack")
                } // END CATEGORY LIST
                .padding(.vertical)
            }
            .padding([.horizontal],5)
            
            
//            NavigationLink(destination: FilterTab()){
//                Text("Filter")
//                    .foregroundStyle(Color.black)
//                    .font(.custom_font(.regular,size: 12))
//
//                    .padding([.horizontal])
//                    .padding([.vertical],4)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 30)
//                            .stroke(Color.gray, lineWidth: 1))
//                
//            }
//            .padding([.trailing],5)
            
        }
        .background(.gray.opacity(0.04))

    }
    
    
    var productItemCollectionSection: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [
                    GridItem(.flexible(), alignment: .top),
                    GridItem(.flexible(), alignment: .top)
                ], content: {
                    ForEach(arrCategoryProduct) { collection in
                        CategoryProductCell(item: collection)
                    }
                })
            }
            .padding([.horizontal], 8)
            .scrollDisabled(false)
        }
    }
    
    //MARK: CATEGORY VIEW
    @ViewBuilder
    func CategoryItem(image: String, title: String)-> some View {
        
        Button {
            withAnimation{baseData.homeTab = title}
        } label: {
            HStack(spacing: 2) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
//            .overlay(
//                RoundedRectangle(cornerRadius: 30)
//                    .stroke(Color.gray, lineWidth: 1))
            
            .background(
                ZStack {
                    //MARK: - TRANSITION SLIDER
                    if baseData.homeTab == title {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                    }
                }
            
            )
        }
    }
    
}

#Preview {
    ProductCategoryList()
}
