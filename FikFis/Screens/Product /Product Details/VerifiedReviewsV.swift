//
//  VerifiedReviewsV.swift
//  FikFis
//
//  Created by apple on 10/09/24.
//

import SwiftUI

struct VerifiedReviewsV: View {
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    var arrReviewList = ReviewM.all()
    @State var arrRecentView = Card.row()
    @State var arrAppliance = Card.row2()

    var body: some View {
        ScrollView{
            detailsHeader(header: "FikFis Verified Reviews")
            
            customerReviews
            
            writeReviewButton
            
            reviewListView
            
            recentViewedSection

            appliancesSection
        }
    }
    
    var writeReviewButton : some View{
        HStack(alignment:.center){
            NavigationLink(destination: SignUpV()) {
                
                Text("Write Review")
//                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.custom_font(.regular,size: 18))
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: appWidth - 20, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 1)
                        )
            }
            .cornerRadius(25)
        }
        .padding(.vertical)
    }
    
    
    var reviewsList : some View{
        HStack(alignment:.center){
            NavigationLink(destination: SignUpV()) {
                Text("Write Review")
//                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.custom_font(.regular,size: 18))
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: appWidth - 20, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 1)
                        )
            }
            .cornerRadius(25)
        }
        .padding(.vertical)
    }

    
    var customerReviews : some View{
        VStack(alignment: .leading) {
            let graphWidth = appWidth * 0.7
            Text("Customer reviews")
                .font(.custom_font(.medium, size: 20))
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
            
            StarRatingView(rating:.constant(4))
                .frame(width: 105, height: 15)
            HStack{
                Text("5")
                    .font(.custom_font(.regular, size: 10))
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                HStack(spacing: 0) {
                    Rectangle().fill(Color.init(hex: "FBB540"))
                        .frame(width: 0.8 * graphWidth,height: 4)
                    Rectangle()
                        .fill(Color.init(hex: "D2D2D2"))
                        .frame(width: 0.2 * graphWidth,height: 4)
                }
                Text("80%")
                    .font(.custom_font(.regular, size: 10))
            }
            
            HStack{
                Text("4")
                    .font(.custom_font(.regular, size: 10))
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                HStack(spacing: 0) {
                    Rectangle().fill(Color.init(hex: "FBB540"))
                        .frame(width: 0.6 * graphWidth,height: 4)
                    Rectangle()
                        .fill(Color.init(hex: "D2D2D2"))
                        .frame(width: 0.4 * graphWidth,height: 4)
                }
                Text("60%")
                    .font(.custom_font(.regular, size: 10))
            }
            
            HStack{
                Text("3")
                    .font(.custom_font(.regular, size: 10))
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                HStack(spacing: 0) {
                    Rectangle().fill(Color.init(hex: "FBB540"))
                        .frame(width: 0.4 * graphWidth,height: 4)
                    Rectangle()
                        .fill(Color.init(hex: "D2D2D2"))
                        .frame(width: 0.6 * graphWidth,height: 4)
                }
                Text("40%")
                    .font(.custom_font(.regular, size: 10))
            }

            HStack{
                Text("2")
                    .font(.custom_font(.regular, size: 10))
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                HStack(spacing: 0) {
                    Rectangle().fill(Color.init(hex: "FBB540"))
                        .frame(width: 0.2 * graphWidth,height: 4)
                    Rectangle()
                        .fill(Color.init(hex: "D2D2D2"))
                        .frame(width: 0.8 * graphWidth,height: 4)
                }
                Text("20%")
                    .font(.custom_font(.regular, size: 10))
            }
            
            HStack{
                Text("1 ")
                    .font(.custom_font(.regular, size: 10))
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                HStack(spacing: 0) {
                    Rectangle().fill(Color.init(hex: "FBB540"))
                        .frame(width: 0.1 * graphWidth,height: 4)
                    Rectangle()
                        .fill(Color.init(hex: "D2D2D2"))
                        .frame(width: 0.9 * graphWidth,height: 4)
                }
                Text("10%")
                    .font(.custom_font(.regular, size: 10))
            }

            Text("How are ratings calculated?")
                .font(.custom_font(.medium, size: 18))
                .padding([.vertical],10)
            
            Text("To calculate the overall star rating and percentage breakdown by star, we don’t use a simple average. Instead, our system considers things like how recent a review is and if the reviewer bought the item on Amazon. It also analyses reviews to verify trustworthiness.")
                .font(.custom_font(.medium, size: 14))
                .foregroundStyle(Color.init(hex: "454545"))
        
        }
        .frame(width: appWidth - 20,height: 400,alignment: .leading)
        .background(Color.init(hex: "F6F6F6").cornerRadius(5, corners: .allCorners))
//        .padding([.leading],10)
    }
    
    func detailsHeader(header : String) -> some View {
        return HStack {
            Text(header)
                .font(.custom_font(.medium, size: 25))
            Spacer()
        }
        .padding([.top, .horizontal],10)
    }
    
    var reviewListView:some View{
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(arrReviewList) { review in
                ReviewRow(arrProductImages: arrImages_static)
            }
        }
        .frame(height: 800)
        .scrollDisabled(true)
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
    VerifiedReviewsV()
}
