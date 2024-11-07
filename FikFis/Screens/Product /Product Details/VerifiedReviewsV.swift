//
//  VerifiedReviewsV.swift
//  FikFis
//
//  Created by apple on 10/09/24.
//

import SwiftUI

struct Toast<Presenting>: View where Presenting: View {

    /// The binding that decides the appropriate drawing in the body.
    @Binding var isShowing: Bool
    /// The view that will be "presenting" this toast
    let presenting: () -> Presenting
    /// The text to show
    let text: Text

    var body: some View {

        GeometryReader { geometry in

            ZStack(alignment: .center) {

                self.presenting()
                    .blur(radius: self.isShowing ? 1 : 0)

                VStack {
                    self.text
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .transition(.slide)
                .opacity(self.isShowing ? 1 : 0)

            }

        }

    }

}

struct VerifiedReviewsV: View {
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    var arrReviewList = ReviewM.all()
    @State var arrRecentView = Card.row()
    @State var arrAppliance = Card.row2()
    @Binding var isVisibleWriteReviews: Bool
    @EnvironmentObject var overlayManager: OverlayManager
    @State private var fullName_review: String = ""
    @State private var email_review: String = ""
    @State private var phone_review: String = ""
    @State private var write_review: String = ""

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
        
        return HStack(alignment:.center){
            Button{
                isVisibleWriteReviews = true
                overlayManager.show(
                    writeReviewView
                    ,dismissOnTap: false
                )
                
            }
            label:{
                Text("Write Review")
                    .font(.custom_font(.regular,size: 18))
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: appWidth - 20, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
            
        }
        .cornerRadius(25)
    }
    
    
    var writeReviewView: some View {
        LazyVStack(alignment: .leading ){
            HStack{
                HeaderLabel(header: "Write a review")
                
                Spacer()
                
                Button{
                    overlayManager.hide()
                }label: {
                    Image(systemName: "xmark")
                        .tint(Color.theme)
                        .fontWeight(.bold)
                }
            }
            .padding()
            
            StarRatingView(rating:.constant(0))
                .frame(width: 150, height: 20)
            
            LazyVStack(alignment: .leading){
                Text("Full name(First and last name)")
                    .font(.custom_font(.regular,size: 16))
                
                
                TextField("Full name(First and last name)", text: $fullName_review)
                    .placeholder(when: fullName_review.isEmpty){
                    }
                    .frame(height:textFieldHeight)
                
                    .padding()
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1))
                //----------------------------------------------------------------------
                    .padding(.bottom)
                //----------------------------------------------------------------------
                Text("Email")
                    .font(.custom_font(.regular,size: 16))
                
                TextField("Email", text: $email_review)
                    .placeholder(when: email_review.isEmpty) {
                    }
                    .frame(height:textFieldHeight)
                
                    .padding()
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1))
                
                //----------------------------------------------------------------------
                Text("Phone")
                    .font(.custom_font(.regular,size: 16))
                
                TextField("Phone Number", text: $phone_review)
                    .placeholder(when: phone_review.isEmpty) {
                    }
                
                    .frame(height:textFieldHeight)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1))
                
                Text("Write your review")
                    .font(.custom_font(.regular,size: 16))
                
                TextField("Your review", text: $write_review)
                    .frame(height:60)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1))
                
                Button{
                    //                        self.isLogin = true
                } label:{
                    Text("Submit")
                        .foregroundColor(.black)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height:textFieldHeight)
                        .padding()
                        .background(Color.theme)
                        .cornerRadius(buttonCornerRadius, corners: .allCorners)
                    
                }
                .padding()
                
                
            }
            .padding(.horizontal)
            
        }
        .frame(width: appWidth * 0.90, height: appHeight * 0.75)
        .background(Color.white)
        .cornerRadius(8)
        
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
                ForwardButton(imageName: "arrow.forward", size: 2, destination: ProductListingV())
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
                ForwardButton(imageName: "arrow.forward", size: 2, destination: ProductListingV())
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
    VerifiedReviewsV(isVisibleWriteReviews: .constant(false))
}
