//
//  NotificationRow.swift
//  FikFis
//
//  Created by apple on 06/09/24.
//

import SwiftUI

struct NotificationRow: View {
    let size:CGFloat = 100
    var notification:NotificationM
    var body: some View {
        VStack(alignment: .leading){
            upperView
                .padding([.leading],10)
        }
        .border(Color.init(hex: "D1D1D1"),width: 1)
        .background(Color.clear.cornerRadius(6))
//        .padding([.horizontal],10)

    }
    
    var upperView : some View{
        HStack{

            Image("\(notification.productImage)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .cornerRadius(12)
                .frame(width: size,height: size)
            VStack(alignment: .leading){
                Text(notification.productImage)
                    .font(.custom_font(.medium,size: 20))

                
                Text(notification.productDescription)
                    .font(.custom_font(.regular,size: 12))
                    .foregroundStyle(Color.init(hexa: "1C1C1C"))
                    .padding([.trailing],10)
                
            }
            .padding([.bottom])
                
        }
        .frame(width: UIScreen.screenWidth - 30,height: 140)

    }
    
    
    
}

#Preview {
    NotificationRow(notification: NotificationM(productName: "Kid shoes", productDescription: "Unsupported layout off the main thread for UICollectionView with nearest ancestor view controller", productImage: "product1"))
}
