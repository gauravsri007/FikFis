//
//  AddressV.swift
//  FikFis
//
//  Created by apple on 25/09/24.
//

import SwiftUI

struct AddressV: View {
    
    @Binding var presentView: Bool
    
    var body: some View {
        VStack {

        }
        .frame(width: appWidth, height: appHeight)
        .background(.black.opacity(0.3))
        .onTapGesture {
            presentView.toggle()
        }
    }
}

#Preview {
    AddressV(presentView: .constant(true))
}
