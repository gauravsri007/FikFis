//
//  FilterV.swift
//  FikFis
//
//  Created by apple on 17/09/24.
//

import SwiftUI

struct FilterTab: View {
    
    @State var tabIndex = 0
    let lightGrayColor = Color.init(hex: "F6F6F6")
    var body: some View {
       
        VStack(alignment: .leading){
            NavigationHeader_filter(navHeader: "Filter", isRightBarItemHidden: true)
            
            filterTab
        }
    }
    
    var filterTab : some View{
        GeometryReader { proxy in
            ScrollView {
                
                HStack(spacing: 0) {
                    Section {
                        TabView(selection: $tabIndex) {
                            VStack {
                                FilterContentV(arrContent: arrPrice)
                            }
                            .frame(maxWidth: .infinity)
                            .tag(0)
                            
                            VStack {
                                FilterContentV(arrContent: arrBrand)
                            }
                            .frame(maxWidth: .infinity)
                            .tag(1)
                            
                            VStack {
                                FilterContentV(arrContent: arrRating)

                            }
                            .frame(maxWidth: .infinity)
                            .tag(2)
                            
                            VStack {
                                FilterContentV(arrContent: arrCategory)
                            }
                            .frame(maxWidth: .infinity)
                            .tag(3)
                            
                            VStack {
                                FilterContentV(arrContent: arrColor)
                            }
                            .frame(maxWidth: .infinity)
                            .tag(4)
                            
                            VStack {
                                FilterContentV(arrContent: arrSize)
                            }
                            .frame(maxWidth: .infinity)
                            .tag(5)
                            
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .frame(maxWidth: .infinity, minHeight: proxy.size.height)
                    } header: {
                        VStack(alignment: .leading) {
                            Button {
//                                withAnimation {
                                    tabIndex = 0
//                                }
                            } label: {
                                Text("Price")
                                    .font(.custom_font(.medium, size: 14))

                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(tabIndex == 0 ? lightGrayColor : .white)
//
                            Button {
//                                withAnimation {
                                    tabIndex = 1
//                                }
                            } label: {
                                Text("Brand")
                                    .font(.custom_font(.medium, size: 14))

                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(tabIndex == 1 ? lightGrayColor : .white)

                            Button {
//                                withAnimation {
                                    tabIndex = 2
//                                }
                            } label: {
                                Text("Rating")
                                    .font(.custom_font(.medium, size: 14))

                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(tabIndex == 2 ? lightGrayColor : .white)
                            
                            Button {
//                                withAnimation {
                                    tabIndex = 3
//                                }
                            } label: {
                                Text("Category")
                                    .font(.custom_font(.medium, size: 14))

                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(tabIndex == 3 ? lightGrayColor : .white)
//
                            Button {
//                                withAnimation {
                                    tabIndex = 4
//                                }
                            } label: {
                                Text("Color")
                                    .font(.custom_font(.medium, size: 14))

                                    .font(.custom_font(.medium, size: 14))

                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(tabIndex == 4 ? lightGrayColor : .white)

                            Button {
//                                withAnimation {
                                    tabIndex = 5
//                                }
                            } label: {
                                Text("Size")
                                    .font(.custom_font(.medium, size: 14))
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(tabIndex == 5 ? lightGrayColor : .white)

                            Spacer()
                        }
                        .background(.white)
                        .frame(width: 120)
                        .cardViewStyle()

                    }
                }
            }
        }
    }
}

#Preview {
    FilterTab()
}
