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
        Text(header)
            .font(.custom_font(.medium,size: header_font))
            .underline(true,color: .yellow)
    }
}

#Preview {
    HeaderLabel(header: "Demo")
}
