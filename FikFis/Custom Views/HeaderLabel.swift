//
//  HeaderLabel.swift
//  FikFis
//
//  Created by apple on 25/08/24.
//

import SwiftUI


struct HeaderLabel: View {
    @State var header:String
    
    var body: some View {
//        Text(header)
//            .font(.custom_font(.medium,size: header_font))
//            .underline(true,color: .yellow)
        VStack(alignment: .leading) {
            Text(header)
                .font(.custom_font(.medium,size: header_font))
            .padding()
            
            Rectangle()
                .foregroundStyle(Color.themeColor)
                .frame(width: 100, height: 5)
                .padding(.leading)
                .padding(.top, -20)
        }
    }
}

#Preview {
    HeaderLabel(header: "Demo")
}
