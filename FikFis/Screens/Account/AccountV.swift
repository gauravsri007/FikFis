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
        HStack {
            Spacer()
            Image("\(collection.imageUrl)")
                .resizable()
                .cornerRadius(12)
                .frame(width: size, height: size)
                .aspectRatio(contentMode: .fit)
            Spacer()
            Text(collection.title)
                .font(.custom_font(.regular,size: 12))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: 100, height: 40, alignment: .top)
                .background(Color.red)

            Spacer()

        }
        .frame(width: (UIScreen.screenWidth / 2) - 30, height: 50, alignment: .top)
        .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
         }
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
    
    var body: some View {
        VStack{
            NavigationHeader()
                .searchable(text: $inputText)
                .background(Color.themeColor.ignoresSafeArea())
                .padding(.bottom)
            Spacer()
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
    }
}

#Preview {
    AccountV()
}
