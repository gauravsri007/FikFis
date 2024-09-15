//
//  HomeV.swift
//  FikFis
//
//  Created by apple on 04/08/24.
//

import SwiftUI

struct HomeV: View {
    
    @State private var searchText = ""
    @State private var searchIsActive = false
    let coverImages: [ImagePagerM]
    @State var collection1 = Card.all()
    @State var arrAppliance = Card.row2()
    @State var arrRecentViewRow = Card.row()


    var body: some View {
        VStack(spacing: 0){
            
            HomeNavigationV()
            
            ScrollView(showsIndicators: false) {
                
                Spacer().frame(height: 10)
                
                searchSection
                
                coverImageSection
                
                collectionSection

                appliancesSection_2Rows(header: "Under 10$ Quality Product")
                
                imageSection
                
                recentViewedRow(header: "Recent Viewed")
                
                recentViewedRow(header: "Women Fashion start at $5")

                appliancesSection_2Rows(header: "Mens Fashion")
                
//                recentViewedSection
//                appliancesSection
//                productItemCollectionSection
            }
        }
    }
    
    var imageSection: some View {
        Image("paging1")
            .resizable()
            .frame(height: 160)
            .padding(.horizontal)
            .aspectRatio(contentMode: .fill)
    }
    
    
    var searchSection: some View {
        HStack {
            TextField("Search for product", text: $searchText)
                .padding(12)
                .background(Color.init(hex: "#F1F1F1"))
                .cornerRadius(8)
                .padding(.leading, 15)
            
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
            }
            .frame(width: 17, height: 17)
            .foregroundStyle(.black)
            .padding(15)
            .background {
                Color.themeColor.cornerRadius(5)
            }
            .padding(.trailing)
        }
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
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 160)
    }
    
    
    func appliancesSection_2Rows(header : String)-> some View {
        VStack {
            HStack {
//                Text("Under 10$ Quality Product")
                Text(header)

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
                        
        }
        .cardViewStyle()
        .padding(.horizontal)
    }
    
    var collectionSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(collection1) { collection in
                    CollectionView(item: collection)
                }
            }
            .padding(.top, 6)
        }
        .padding(.horizontal)

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
                    ForEach(collection1) { collection in
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
    
    var recentViewedSection: some View {
        HStack {
            Text("Recent Viewed")
                .font(.custom_font(.medium, size: 17))
            Spacer()
            ForwardButton(imageName: "arrow.forward", size: 2)
        }
        .padding([.top, .horizontal])
    }
    
    func recentViewedRow(header:String)-> some View {
        VStack{
            HStack {
                Text(header)
                    .font(.custom_font(.medium, size: 17))
                Spacer()
                ForwardButton(imageName: "arrow.forward", size: 2)
            }
            .padding([.top, .horizontal])
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [
                    GridItem(.flexible(), alignment: .top),
                    GridItem(.flexible(), alignment: .top)
                ], content: {
                    ForEach(arrRecentViewRow) { collection in
                        ProductItem(item: collection)
                    }
                })
            }.padding([.horizontal], 8)
        }
    }
    
    var productItemCollectionSection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [
                GridItem(.flexible(), alignment: .top),
                GridItem(.flexible(), alignment: .top)
            ], content: {
                ForEach(collection1) { collection in
                    ProductItem(item: collection)
                }
            })
        }.padding([.horizontal], 8)
    }

}

#Preview {
    HomeV(coverImages: [
        ImagePagerM(image: UIImage(named: "paging1"), title: "1", titleColor: .red, action: {} ),
        ImagePagerM(image: UIImage(named: "paging2"), title: "1", titleColor: .red, action: {} ),
        ImagePagerM(image: UIImage(named: "product3"), title: "1", titleColor: .red, action: {} )])
}
