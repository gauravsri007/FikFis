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
    @State var header : String

    var body: some View {
        VStack(alignment: .leading) {
            NavigationHeader(isBellIconHidden: false)
            
            HeaderLabel(header: header)
                .padding([.horizontal,.bottom])


            CardView_category()
        }
        .toolbar(.visible, for: .tabBar)
    }

}

#Preview {
    CategoryV(header: "main")
}
