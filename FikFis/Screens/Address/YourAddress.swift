//
//  YourAddress.swift
//  FikFis
//
//  Created by apple on 27/08/24.
//

import SwiftUI

struct YourAddress: View {
    let arrAddress = Address.all()

    
    var body: some View {
        VStack {
            NavigationHeader()
                .background(Color.themeColor.ignoresSafeArea())
            HeaderLabel(header: "Your Address")
            
            addressCollection
            
        }
    }
    
    var addressCollection : some View{

        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [
                GridItem(.flexible(), alignment: .top),
                GridItem(.flexible(), alignment: .top)

            ]) {
                ForEach(self.arrAddress, id: \.id) { _address in
                    AddressRow(address: _address)
                }
            }

        }
        .padding([.leading,.trailing],10)

    }
}

#Preview {
    YourAddress()
}
