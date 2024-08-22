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
    var corners: UIRectCorner = .allCorners
    @State var arrCollection1 : [String] = ["Kid shoes","Womens clothes","Mens clothes"]
    @State var collection1 : [Card] = [
        Card(id: 0, title: "Kid shoes", imageUrl: "paging1"),
        Card(id: 1, title: "Womens shoes", imageUrl: "paging1"),
        Card(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "paging1"),
        Card(id: 3, title: "Kid clothes", imageUrl: "paging1"),
        Card(id: 4, title: "Min. 40% off | Washing machines", imageUrl: "paging1"),
        Card(id: 5, title: "Mens clothes", imageUrl: "paging1")
    ]

    var body: some View {
        VStack(spacing: 0){
            
            HomeNavigationV()
            
            ScrollView(showsIndicators: false) {
                
                Spacer().frame(height: 10)
                
                coverImageSection
                
                collectionSection
                
                appliancesSection
                
                recentViewedSection
                
                productItemCollectionSection
                
            }
        }
    }
    
    var coverImageSection: some View {
        TabView {
            ForEach(coverImages,id: \.self) { item in
                Image(uiImage: item.image ?? UIImage())
                    .resizable()
                    .padding(.horizontal)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 200)
    }
    
    var collectionSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(collection1) { collection in
                    CollectionView(item: collection)
                }
            }
            .padding(.top, 6)
            .padding(.horizontal)
        }
    }
    
    var appliancesSection: some View {
        VStack {
            HStack {
                Text("Home Appliances Up to 55% off")
                Spacer()
                ForwardButton(size: 2)
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [
                    GridItem(.flexible(), alignment: .top),
                    GridItem(.flexible(), alignment: .top)
                ]) {
                    ForEach(collection1) { collection in
                        FrameView(item: collection)
                    }
                }
                .padding(.horizontal)
            }
            
            HStack {
                Button {
                    
                } label: {
                    Text("Explore Now")
                        .bold()
                        .foregroundStyle(.black)
                }
                .padding(10)
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
        .padding()
    }
    
    var recentViewedSection: some View {
        HStack {
            Text("Recent Viewed")
            Spacer()
            ForwardButton(size: 2)
        }
        .padding()
    }
    
    var productItemCollectionSection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                ForEach(collection1) { collection in
                    ProductItem(item: collection)
                        .padding(10)
                }
            })
        }
    }

}

#Preview {
//    VStack {
        HomeV(coverImages: [ImagePagerM(image: UIImage(named: "paging1"), title: "1", titleColor: .red, action: {} ),ImagePagerM(image: UIImage(named: "paging2"), title: "1", titleColor: .red, action: {} )])
//        Spacer()
//    }
}
