//
//  HeaderLabel.swift
//  FikFis
//
//  Created by apple on 25/08/24.
//

import SwiftUI


struct HeaderLabel: View {
    @State var header:String
    @State var font:CGFloat = 20

    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.custom_font(.medium,size: header_font))
                .overlay(
                    Rectangle()
                        .fill(Color.theme)
                        .frame(height: 4)
                        .offset(y:  10)
                    , alignment: .bottom
                )
        }
        .padding(.bottom)
    }
}

#Preview {
    HeaderLabel(header: "Demo sdfsfsdfsfsf")
}
