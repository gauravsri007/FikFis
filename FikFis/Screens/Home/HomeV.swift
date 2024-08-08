//
//  HomeV.swift
//  FikFis
//
//  Created by apple on 04/08/24.
//

import SwiftUI

struct Collection1{
    var id: Int
    var title,imageUrl : String
}

struct CollectionView : View{
    let collec : Collection1
    var body: some View {
        VStack{
            Image("\(collec.imageUrl)")
                .resizable()
                .cornerRadius(12)
                .frame(width: 80,height: 80)
            Text(collec.title)
                .font(.subheadline)

        }
    }
}


struct HomeV: View {
    
    @State private var searchText = ""
    @State private var searchIsActive = false
    let coverImages: [ImagePagerM]
    var corners: UIRectCorner = .allCorners
    var arrCollection1 : [String] = ["Kid shoes","Womens clothes","Mens clothes"]
    let collection1 : [Collection1] = [
        Collection1(id: 0, title: "Kid shoes", imageUrl: "paging1"),
        Collection1(id: 1, title: "Womens shoes", imageUrl: "paging1"),
        Collection1(id: 2, title: "Mens shoes", imageUrl: "paging1"),
        Collection1(id: 3, title: "Kid clothes", imageUrl: "paging1"),
        Collection1(id: 4, title: "Womens clothes", imageUrl: "paging1"),
        Collection1(id: 5, title: "Mens clothes", imageUrl: "paging1")
    ]

    var body: some View {
        
        Group{
            HStack(){
                VStack(alignment: .leading){
                    Text("Welcome FikFis")
                        .font(.custom_font(.semibold,size: 34))
                    Text("Free Shipping | \(7) Days Return")
                        .font(.custom_font(.regular,size: 15))
                        .foregroundColor(.white)
                }
                .padding(10)
                //                .background(Color.blue)
                //                .frame(maxWidth: .infinity)
                Spacer()
                //                .cornerRadius(40,corners: [.bottomLeft,.bottomRight])
                
                Button(action: {
                    // handle tap
                }) {
                    Image("bell_navigation")
                        .renderingMode(.template)
                        .foregroundStyle(Color.black)
                        .padding(15)
                        .background {
                            Circle()
                                .foregroundStyle(Color.white)
                        }
                }
                .padding(10)
                
            }
            .font(.headline)
            .background(Color.yellow.ignoresSafeArea())
            //            .cornerRadius(40,corners: [.bottomLeft,.bottomRight])
            
            
            VStack(alignment: .leading){
                ScrollView {
                    TabView {
                        ForEach(coverImages,id: \.self) { item in
                            Image(uiImage: item.image ?? UIImage())
                                .resizable()
                            //                                .frame(height: 400)
                            //                                .scaledToFit()
                        }
                    } //: Tabview
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 200)
                    //                    Spacer()
                }
                //                .background(.red)
                .frame(height: 300)
                Spacer()
                
            }
            .padding()
            
            //-------------------- Collection 1 --------------------------
//            VStack(alignment: .leading){
//            ScrollView(.horizontal) {
//                    HStack{
//                        ForEach(coverImages) { image in
//                            Image(image)
//                                .resizable()
//                                .cornerRadius(12)
//                                .frame(width: 80,height: 80)
//                        }
//
//                        }
//
//                    }
//                .padding(20)
//            }
        }
        //        .background(Color.yellow.ignoresSafeArea())
        //        .cornerRadius(40,corners: [.bottomLeft,.bottomRight])
    }

}

#Preview {
    VStack {
        HomeV(coverImages: [ImagePagerM(image: UIImage(named: "paging1"), title: "1", titleColor: .red, action: {} ),ImagePagerM(image: UIImage(named: "paging2"), title: "1", titleColor: .red, action: {} )])
        Spacer()
    }
}
