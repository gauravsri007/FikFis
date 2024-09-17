//
//  FilterContentV.swift
//  FikFis
//
//  Created by apple on 17/09/24.
//

import SwiftUI

struct FilterContentV: View {
    @State var arrContent : [String]
    @State var arrSlectedItem : [CommonModel] = []
    


    var body: some View {
        VStack(alignment: .leading){
            ForEach(arrContent, id: \.self){index in
                //MARK: - BODY TOP
                VStack(alignment: .leading,spacing: 5){
                    HStack(spacing: 15) {
                        Button {
                        } label: {
                            HStack(spacing: 3) {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 15,height: 15)
                            }
                            .foregroundColor(.gray)
                        }
                        
                        Text(index)
                            .font(.custom_font(.medium, size: 14))
                        Spacer()

                    } // END BODY TOP
//                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.top, 10)
                }
                .padding(.top)
            }
        }
        .padding(.leading)
        Spacer()

    }
}

#Preview {
    FilterContentV(arrContent: arrPrice)
}
