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
    
    var body: some View {
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
            }
            .padding(.horizontal, 10)
            .font(.headline)
            .frame(height: 80)
        }
        .background(Color.themeColor.ignoresSafeArea(.all).cornerRadius(30, corners: [.bottomLeft, .bottomRight]))
        
    }
}

#Preview {
    NavigationHeader()
}

