//
//  AccountV.swift
//  FikFis
//
//  Created by apple on 05/08/24.
//

import SwiftUI

struct AccountV: View {
    
    @Environment(\.dismiss) var dismiss
    
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
    
    @State var policies : [CommonModel] = [CommonModel(id: 0, title: "FAQ's"),
                                           CommonModel(id: 1, title: "Terms & Condition"),
                                           CommonModel(id: 2, title: "Privacy Policy"),
                                           CommonModel(id: 3, title: "Disclaimer"),
                                           CommonModel(id: 4, title: "Refund policy"),
                                           CommonModel(id: 5, title: "Returns & Refunds"),
                                           CommonModel(id: 6, title: "Shippings & Delivery"),
                                           CommonModel(id: 7, title: "Order Cancellation")
    ]
    
    var followUs: [CommonModel] = [CommonModel(id: 0, title: "@fikfis", image: "youtube_followUs"),
                                   CommonModel(id: 1, title: "@fikfis", image: "twitter_followUs"),
                                   CommonModel(id: 2, title: "@fikfis", image: "instagram_followUs"),
                                   CommonModel(id: 3, title: "@fikfis", image: "facebook_followUs")]
    
    var aboutUs: [CommonModel] = [CommonModel(id: 0, title: "About Us"),
                                  CommonModel(id: 1, title: "Blog"),
                                  CommonModel(id: 2, title: "Contact Us")
    ]
    
    var appStore: [CommonModel] = [CommonModel(id: 0, title: "Download on the", desc: "App Store", image: "apple"),
                                   CommonModel(id: 1, title: "www.fikfis.com", desc: "Visit Today", image: "globe")
    ]
    
    var body: some View {
        VStack{
            NavigationHeader(isBellIconHidden: false)
                .padding(.bottom)
            ScrollView(.vertical, showsIndicators: false) {
                Group{
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: [
                            GridItem(.flexible(), alignment: .top),
                            GridItem(.flexible(), alignment: .top)
                        ]) {
                            ForEach(collection1) { collection in
                                headerTab(collection: collection)
                            }
                        }
                        
                        .padding(.horizontal)
                    }
                }
                
                HStack(alignment: .top){
                    policies_View
                    
                    followUs_View
                }
                
                fikfis_view
                
                channel_view
            }
        }
    }
    
    func headerTab(collection: Card) -> some View {
        VStack {
            if collection.id == 8 {
                Button {
                    dismiss()
                } label: {
                    labelView(collection: collection)
                }
            } else {
                NavigationLink(destination: {
                    if collection.id == 0 {
                        ProfileV()
                    }
                    else if collection.id == 1 {
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
                }, label: {
                    labelView(collection: collection)
                })
            }
        }
    }
    
    func labelView(collection: Card) -> some View {
        HStack {
            Image("\(collection.imageUrl)")
                .resizable()
                .frame(width: 20, height: 20)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.black)
            Text(collection.title)
                .font(.custom_font(.regular,size: 16))
                .lineLimit(2)
                .frame(height: 50)
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
        }
        .frame(width: (UIScreen.screenWidth / 2) - 20, height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(.gray, lineWidth: 1)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 6)
        )
    }
    
    var policies_View : some View{
        return HStack {
            VStack(alignment: .leading){
                HeaderLabel(header: "Policies")
                
                ForEach(policies, id: \.id) { policy in
                    policiesLabel(text: policy.title, action: {
                        print(policy.title)
                    })
                }.padding(.leading, 20)
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    func policiesLabel(text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .font(.custom_font(.regular, size: 15))
                .foregroundColor(.black)
                .padding(.vertical, 1)
        }
    }
    
    var followUs_View : some View{
        HStack {
            VStack(alignment: .leading){
                HeaderLabel(header: "Follow us")
                
                ForEach(followUs, id: \.id) { follow in
                    followUsLabel(text: follow.title, image: follow.image, action: {
                        print(follow.title)
                    })
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    func followUsLabel(text: String, image: String?, action: @escaping () -> Void) -> some View {
        Button(){
            
        } label:{
            if let image = image {
                Image(image).cornerRadius(5)
            }
            Text(text)
                .font(.custom_font(.regular,size: 14))
                .foregroundColor(.black)
        }.padding(.leading, 20)
    }
    
    
    var fikfis_view : some View{
        return HStack {
            VStack(alignment: .leading){
                HeaderLabel(header: "FikFis")
                ForEach(aboutUs, id: \.id) { policy in
                    policiesLabel(text: policy.title, action: {
                        print(policy.title)
                    })
                }.padding(.leading, 20)
            }
            Spacer()
        }
    }
    
    var channel_view : some View{
        VStack(alignment: .leading){
            HeaderLabel(header: "FikFis Channels").padding(.leading, -10)
            HStack {
                ForEach(appStore, id: \.id) { button in
                    appStoreButton(text: button.title, desc: button.desc, image: button.image, action: {
                        print(button.title, "clicked")
                    })
                }
            }
        }
    }
    
    @ViewBuilder
    func appStoreButton(text: String, desc: String?, image: String?, action: @escaping () -> Void) -> some View {
        Button(){
            
        } label:{
            HStack {
                if let image = image {
                    Image(image)
                        .frame(width: 32,height: 32)
                }
                VStack(alignment: .leading){
                    Text(text)
                        .font(.custom_font(.regular,size: 12))
                        .foregroundStyle(Color.white)
                        .lineLimit(1)
                    if let desc = desc {
                        Text(desc)
                            .font(.custom_font(.medium,size: 18))
                            .foregroundStyle(Color.white)
                            .lineLimit(1)
                    }
                }
            }
            .frame(width: (appWidth/2)-50)
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background(content: {
                RoundedRectangle(cornerRadius: 80).foregroundStyle(.black)
            })
            .padding(.bottom)
        }
    }
}



#Preview {
    AccountV()
}
