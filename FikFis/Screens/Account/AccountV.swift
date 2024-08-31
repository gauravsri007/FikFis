//
//  AccountV.swift
//  FikFis
//
//  Created by apple on 05/08/24.
//

import SwiftUI

struct HeaderTab: View {
    let collection : Card
    @State var size: CGFloat = 20

    var body: some View {
        NavigationLink(destination: {
            if collection.id == 1 {
                MyOrders()
            }
            else if collection.id == 2{
                YourAddress()
            }
            else if collection.id == 7 {
                WishListV(arrWishList: [
                    ProductM(id: 0, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35"),
                    ProductM(id: 1, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35"),
                    ProductM(id: 2, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35"),
                    ProductM(id: 3, productRating: 3, productName: "aa", productPrice: "123", imageUrl: "product", ProductDiscount: "35")])
            }
        },
            label: {
            HStack {
                Image("\(collection.imageUrl)")
                    .resizable()
                    .cornerRadius(12)
                    .frame(width: size, height: size)
                    .aspectRatio(contentMode: .fit)
                Text(collection.title)
                    .font(.custom_font(.regular,size: 16))
                    .lineLimit(2)
                    .frame(width: 100, height: 40, alignment: .leading)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
            }
            .frame(width: (UIScreen.screenWidth / 2) - 20, height: 50, alignment: .top)
            .cornerRadius(6.0)
            .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        })
    }
}


struct Policies: Identifiable {
    var id: Int
    var title : String
}

struct AccountV: View {
    @State private var inputText: String = ""
    
    @State var collection1 : [Card] = [
        Card(id: 0, title: "Your Profile", imageUrl: "user"),
        Card(id: 1, title: "Your Orders", imageUrl: "shopping"),
        Card(id: 2, title: "Your Address", imageUrl: "pin"),
        Card(id: 3, title: "Your Reviews", imageUrl: "favourite"),
        Card(id: 4, title: "Support", imageUrl: "customer_service"),
        Card(id: 5, title: "Share App", imageUrl: "share"),
        Card(id: 6, title: "Rate Us", imageUrl: "star"),
        Card(id: 7, title: "Wishlist", imageUrl: "heart"),
        Card(id: 8, title: "Logout", imageUrl: "arrow_exit")
    ]
    
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    @State var header_font: CGFloat = 30

    @State var policies : [Policies] = [Policies(id: 0, title: "FAQ's"),
                                        Policies(id: 1, title: "Terms & Condition"),
                                        Policies(id: 2, title: "Privacy Policy"),
                                        Policies(id: 3, title: "Disclaimer"),
                                        Policies(id: 4, title: "Refund policy"),
                                        Policies(id: 5, title: "Returns & Refunds"),
                                        Policies(id: 6, title: "Shippings & Delivery"),
                                        Policies(id: 7, title: "Order Cancellation")
    ]
    
    
    var body: some View {
        VStack{
            NavigationHeader()
                .padding(.bottom)
            ScrollView(.vertical, showsIndicators: false) {
                Group{
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: [
                            GridItem(.flexible(), alignment: .top),
                            GridItem(.flexible(), alignment: .top)
                        ]) {
                            ForEach(collection1) { collection in
                                HeaderTab(collection: collection)
                                    
                            }
                        }
                        
                        .padding(.horizontal)
                    }
                }
                
                HStack{
                    policies_view
                    
                    followUs
                    
                }
                
                fikfis_view
                
                channel_view
                
            }
        }
    }
    
    
    
    var policies_view : some View{
        var policy_font_size: CGFloat = 15
        return VStack(alignment: .leading){
            Text("Policies")
                .font(.custom_font(.medium,size: header_font))
                .underline(true,color: .yellow)
            Spacer()
            Button{
                
            }
        label:{
            Text("FAQ's")
                .font(.custom_font(.regular,size: policy_font_size))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
        }
            
            Spacer()
            
            Button{
                
            }
        label:{
            Text("Terms & Condition")
                .font(.custom_font(.regular,size: policy_font_size))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
        }
            
            Spacer()
            
            Button{
                
            }
        label:{
            Text("Privacy Policy")
                .font(.custom_font(.regular,size: policy_font_size))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
            
            Spacer()
            
            Button{
                
            }
        label:{
            Text("Disclaimer")
                .font(.custom_font(.regular,size: policy_font_size))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
            Spacer()
            
            Button{
                
            }
        label:{
            Text("Refund policy")
                .font(.custom_font(.regular,size: policy_font_size))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
            
            Spacer()
            
            Button{
                
            }
        label:{
            Text("Returns & Refunds")
                .font(.custom_font(.regular,size: policy_font_size))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
            
            Spacer()
            
            Button{
                
            }
        label:{
            Text("Shippings & Delivery")
                .font(.custom_font(.regular,size: policy_font_size))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
            
            Spacer()
            
            Button{
                
            }
        label:{
            Text("Order Cancellation")
                .font(.custom_font(.regular,size: policy_font_size))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
            
        }
        .padding([.leading],leadingSpace_account)

    }
    
    
    
    var followUs : some View{
        VStack(alignment: .leading){
            Text("Follow us")
                .font(.custom_font(.medium,size: header_font))
                .underline(true,color: .yellow)
            //            Spacer()
            Button(){
                
            }
        label:{
            Image("youtube_followUs")
            Text("@fikfis")
                .font(.custom_font(.regular,size: 14))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
            
            
            Button(){
                
            }
        label:{
            Image("twitter_followUs")
            Text("@fikfis")
                .font(.custom_font(.regular,size: 14))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
            Button(){
                
            }
        label:{
            Image("instagram_followUs")
            Spacer()
            Text("@fikfis")
                .font(.custom_font(.regular,size: 14))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
            Button(){
                
            }
        label:{
            Image("facebook_followUs")
            Spacer()
            
            Text("@fikfis")
                .font(.custom_font(.regular,size: 14))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
            Spacer()
            
        }
        .padding([.leading])

    }
    
    
    var fikfis_view : some View{
        let fikfis_view_font: CGFloat = 15

        return VStack(alignment: .leading){
            Text("FikFis")
                .font(.custom_font(.medium,size: header_font))
                .underline(true,color: .yellow)
            Spacer()
            Button{
                
            }
        label:{
            Text("About Us")
                .font(.custom_font(.regular,size: fikfis_view_font))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
        }
            
            Spacer()
            
            Button{
                
            }
        label:{
            Text("Blog")
                .font(.custom_font(.regular,size: fikfis_view_font))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
        }
            
            Spacer()
            
            Button{
                
            }
        label:{
            Text("Contact US")
                .font(.custom_font(.regular,size: fikfis_view_font))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
            
            Spacer()
    
        }
        .padding([.leading],leadingSpace_account)

    }
    
    
    
    var channel_view : some View{
        let height : CGFloat = 60
        return VStack(alignment: .leading){
            Text("FikFis Channels")
                .font(.custom_font(.medium,size: header_font))
                .underline(true,color: .yellow)
            Spacer()

            HStack{
                Button(action: {}) {
                    HStack {
                        Image("apple")
                            .frame(width: 32,height: 32)
                        VStack{
                            Text("Download on the")
                                .font(.custom_font(.regular,size: 12))
                            Text("App Store")
                                .font(.custom_font(.medium,size: 20))
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .frame(width: (UIScreen.screenWidth/2) - 10 ,height: height)
                }
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(.infinity)

                
                Button(action: {}) {
                    HStack {
                        Image("globe")
                            .frame(width: 32,height: 32)
                        VStack{

                            Text("www.fikfis.com")
                                .font(.custom_font(.regular,size: 12))
                                .foregroundStyle(Color.white)
                            Text("Visit Today")
                                .font(.custom_font(.medium,size: 18))

                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .frame(width: (UIScreen.screenWidth/2) - 10 ,height: height)

                }
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(.infinity)
            }
        }
        .padding([.leading,.trailing])
    }
}



#Preview {
    AccountV()
}
