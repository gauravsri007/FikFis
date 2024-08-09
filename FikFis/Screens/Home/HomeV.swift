//
//  HomeV.swift
//  FikFis
//
//  Created by apple on 04/08/24.
//

import SwiftUI

struct Collection1: Identifiable {
    var id: Int
    var title,imageUrl : String
}

struct CollectionView: View {
    let collec : Collection1
    var body: some View {
        VStack {
            Image("\(collec.imageUrl)")
                .resizable()
                .cornerRadius(12)
                .frame(width: 80, height: 80)
            Text(collec.title)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: 80, height: 60, alignment: .top)
        }
    }
}

struct FrameView: View {
    let collec : Collection1
    var body: some View {
        VStack(alignment: .leading) {
            Image("\(collec.imageUrl)")
                .resizable()
                .frame(height: 120)
                .cardViewStyle()
            Text(collec.title)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
        .frame(height: 170)
    }
}

struct ProductItem: View {
    let item : Collection1
    var body: some View {
        VStack(alignment: .leading) {
            Image("\(item.imageUrl)")
                .resizable()
                .frame(height: 160)
                .cardViewStyle()
            Text(item.title)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
            StarRatingView(rating: .constant(3))
                .frame(width: 120, height: 30)
            HStack {
                Text("$105100")
                    .bold()
                Text("$105100")
                    .strikethrough()
            }
            
            HStack {
                Text("Save $5")
                    .padding(5)
                    .background {
                        Color.green.cornerRadius(5)
                    }
                Text("$105100")
                    .strikethrough()
            }
        }
        .frame(height: 340)
        .padding(5)
        .cardViewStyle()
    }
}

struct StarRatingView: View {
    @Binding var rating: Int
    var maximumRating = 5
    var color: Color = .yellow

    var body: some View {
        HStack {
            ForEach(1...maximumRating, id: \.self) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(index <= rating ? color : Color(uiColor: .systemGray5))
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}

struct ForwardButton: View {
    
    var size: CGFloat = 30.0
    
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "arrow.forward")
        }
        .frame(width: size, height: size)
        .foregroundStyle(.white)
        .padding()
        .background {
            Color.themeColor
        }
        .clipShape(Circle())
    }
}

#Preview {
    ForwardButton()
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
        Collection1(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "paging1"),
        Collection1(id: 3, title: "Kid clothes", imageUrl: "paging1"),
        Collection1(id: 4, title: "Min. 40% off | Washing machines", imageUrl: "paging1"),
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
            
            
            ScrollView(showsIndicators: false) {
                
                TabView {
                    ForEach(coverImages,id: \.self) { item in
                        Image(uiImage: item.image ?? UIImage())
                            .resizable()
                            .padding(.horizontal)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 200)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(collection1) { collection in
                            CollectionView(collec: collection)
                        }
                    }
                    .padding(.top, 6)
                    .padding(.horizontal)
                }
                
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
                                FrameView(collec: collection)
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
                
                
                HStack {
                    Text("Recent Viewed")
                    Spacer()
                    ForwardButton(size: 2)
                }
                .padding()
                
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
    }

}

#Preview {
    VStack {
        HomeV(coverImages: [ImagePagerM(image: UIImage(named: "paging1"), title: "1", titleColor: .red, action: {} ),ImagePagerM(image: UIImage(named: "paging2"), title: "1", titleColor: .red, action: {} )])
        Spacer()
    }
}


struct CardViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
//            .border(Color(uiColor: UIColor.systemGray6), width: 0.5)
            .background(Color(.systemBackground))
            .cornerRadius(5)
            .shadow(radius: 2)
    }
}

extension View {
    func cardViewStyle() -> some View {
        self.modifier(CardViewModifier())
    }
}
