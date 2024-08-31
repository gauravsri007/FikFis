//
//  YourAddress.swift
//  FikFis
//
//  Created by apple on 27/08/24.
//

import SwiftUI

struct YourAddress: View {
    let arrAddress = Address.all()
    @State var isButtonActive = false

    
    var body: some View {
        NavigationHeader()
        
        VStack(alignment: .leading) {
            HeaderLabel(header: "Your Address")
                .padding(.leading)
            
            
            ZStack{
                addressCollection
                
                NavigationLink(destination: AddAddress(), isActive: $isButtonActive) {
                    
                    Button(action: {
                        self.isButtonActive = true
                    })
                    {
                        Image(systemName: "plus")
                    }
//                    .frame(width: 50, height: 50)
                    .foregroundStyle(.white)
                    .background {
                        Color.themeColor
                    }
                    .clipShape(Circle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding()
                }
                
            }
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



struct AddressRow: View {
    var address: Address

    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 10)
            Text(address.userName)
                .font(.custom_font(.bold,size: 16))
                .foregroundColor(AppColor.secondaryBlack)
            
            Spacer().frame(height: 10)

            Text("Full Addreess : \(address.fullAddress)")
                .font(.custom_font(.medium,size: 15))
                .foregroundColor(AppColor.secondaryBlack)
            
            Spacer().frame(height: 10)

            Text("Phone Number : \(address.phoneNumber)")
                .font(.custom_font(.medium,size: 15))
                .foregroundColor(AppColor.secondaryBlack)
            
            HStack{
                Button(action: {
                }) {
                    Text("Edit")
                        .font(.custom_font(.regular,size: 12))
                }
                .foregroundColor(AppColor.lightGray)
                Text("|")
                    .foregroundColor(AppColor.lightGray)
                Button(action: {
                    
                }) {
                    Text("Remove")
                        .font(.custom_font(.regular,size: 12))
                }
                .foregroundColor(AppColor.lightGray)
                Text("|")
                    .foregroundColor(AppColor.lightGray)
                Button(action: {
                }) {
                    Text("Set as default")
                        .font(.custom_font(.semiBold,size: 12))
                }
                .foregroundColor(AppColor.themeColor_yellow)
            }
            .padding(.vertical)

        }
        .padding(.horizontal, 6)
        .border(Color.gray)
        .frame(width: appWidth / 2 - 16, height: 200)
//        .padding()
        
//        .clipped()
    }
}
