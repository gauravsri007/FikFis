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
        VStack(alignment: .leading,spacing: 30){
            HStack{
                Spacer()

//                Button{
//                    
//                }label: {
//                    Image(systemName: "lock")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                    
//                }
                .frame(width: 30,height: 30)
                .frame(maxWidth: .infinity,alignment:.leading)
                Spacer()

                VStack(alignment: .leading) {
                    TextField("Enter your name", text: $inputText)
                        .frame(width: 280,height: 44)
                        .frame(maxWidth: .infinity,alignment:.center)
                        .padding(.leading,20)
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
                .padding(.trailing,20)
            }
            .frame(height: 40)
            .padding()
            .background(Color.themeColor.ignoresSafeArea())
        }
        .cornerRadius(30, corners: [.bottomLeft,.bottomRight])


    }
}

#Preview {
    NavigationHeader()
}

