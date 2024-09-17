//
//  NavigationView.swift
//  FikFis
//
//  Created by apple on 09/08/24.
//

import SwiftUI

struct SearchBar2: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchbar = UISearchBar(frame: .zero)
        return searchbar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
}


struct NavigationHeader: View {
    @State private var inputText: String = ""
    @State private var isNavigation: Bool = false
    @State var isBellIconHidden : Bool
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Color.themeColor
                    .ignoresSafeArea(.all, edges: .top)
                    .frame(height: 0) // Extend the theme color into the top safe area
                HStack{
                    VStack(alignment: .leading) {
                        TextField("Search for product ", text: $inputText)
                            .frame(width: 280,height: 44)
                            .frame(maxWidth: .infinity,alignment:.center)
                            .padding(.leading,10)
                            .textFieldStyle(.plain)
                            .background(Color.white)
                        
                    }
                    .cornerRadius(30, corners: .allCorners)
                    Spacer()
                    if !isBellIconHidden{
                        NavigationLink(destination: NotificationV()){
                            Image("bell_navigation")
                                .renderingMode(.template)
                                .foregroundStyle(Color.black)
                                .padding(15)
                                .background {
                                    Circle()
                                        .foregroundStyle(Color.white)
                                }
                        }
                    }
                }
                .padding(.horizontal, 10)
                .font(.headline)
                .frame(height: 80)
            }
            .background(Color.themeColor.ignoresSafeArea(.all).cornerRadius(30, corners: [.bottomLeft, .bottomRight]))
        }
    }
}



struct NavigationHeader_filter: View {
    @State private var inputText: String = ""
    @State private var isNavigation: Bool = false
    @State var navHeader : String
    @State var isRightBarItemHidden : Bool

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Color.themeColor
                    .ignoresSafeArea(.all, edges: .top)
                    .frame(height: 0) // Extend the theme color into the top safe area
                HStack{
                    Spacer()

                    Text(navHeader)
                        .font(.custom_font(.medium, size: 18))
                        .padding(.leading)
                    Spacer()
                    
                    if !isRightBarItemHidden{
                        NavigationLink(destination: FilterTab()){
                            Image(systemName:"line.3.horizontal.decrease.circle")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundStyle(Color.black)
                                .padding(15)
                            
                        }
                    }
                    
                }
                .padding(.horizontal, 10)
                .font(.headline)
                .frame(height: 60)
            }
            .background(Color.themeColor.ignoresSafeArea(.all).cornerRadius(30, corners: [.bottomLeft, .bottomRight]))
        }
    }
}

#Preview {
    NavigationHeader_filter(navHeader: "Filter",isRightBarItemHidden: false)
//    NavigationHeader(isBellIconHidden: false)
}

