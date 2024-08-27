//
//  CategoryV.swift
//  FikFis
//
//  Created by apple on 09/08/24.
//

import SwiftUI

struct CategoryCell: View {
    var body: some View {
        Group{
            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Mobile")
            }
            .padding(10)
        }
    }
}




struct CategoryV: View {

    @State private var inputText: String = ""


    var body: some View {
        VStack {
            NavigationHeader()
                .background(Color.themeColor.ignoresSafeArea())
            CardView_category()
        }
    }
}

#Preview {
    CategoryV()
}
