//
//  AddressShippingV.swift
//  FikFis
//
//  Created by apple on 10/11/24.
//

import SwiftUI

struct AddressShippingV: View {
    @State private var selectedTab: Tab_address = .AddAddress
    @Namespace private var animationNamespace //
    @State private var phoneNumber: String = ""
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullAddress: String = ""
    @State private var country: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var pincode: String = ""
    let textFeildHeight:CGFloat = 40
    let textFeildWidth:CGFloat = appWidth * 0.82
    let viewHeight:CGFloat = appHeight * 0.8
    let viewWidth:CGFloat = appWidth * 0.9
    let arrAddress = Address.all()
    @EnvironmentObject var overlayManager: OverlayManager

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    overlayManager.hide()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .frame(width: 30, height: 30)
                }
            }
            
            // Tab content with slide-in animation
            // Tab buttons
            HStack {
                CustomTab_address(label: "Add Address", selectedTab: $selectedTab, tab: .AddAddress, animationNamespace: animationNamespace)
                Spacer()
                CustomTab_address(label: "Saved Address", selectedTab: $selectedTab, tab: .SavedAddress, animationNamespace: animationNamespace)
            }
            .padding()
            //                    .background(Color.gray.opacity(0.2))
            ZStack {
                if selectedTab == .AddAddress {
                    viewAddAddress                           //.transition(.move(edge: .leading))
                        .animation(.easeInOut, value: selectedTab)
                } else if selectedTab == .SavedAddress {
                    viewSavedAddress                            //.transition(.move(edge: .trailing))
                        .animation(.easeInOut, value: selectedTab)
                }
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(width: viewWidth,height: viewHeight)
        .background(Color.white)
        .cornerRadius(5, corners: .allCorners)
        .onTapGesture {
            hideKeyboard() // Call the function to hide the keyboard
        }
    }
    
    var viewAddAddress: some View {
        VStack{
            allContent
            
            RoundedButton(showingAlert: false, alertTitle: "", alertMessage: "", btnTitle: "SAVE ADDRESS", btnHeight:textFeildHeight , btnWidth:textFeildWidth, font: .custom_font(.medium,size: 20))
                .frame(width: textFeildWidth,height: textFeildHeight)
        }
    }


    var allContent : some View{
        let _textFeildWidth_small = (appWidth / 2) - 40

        return VStack(alignment: .leading) {
                Text("Full name (First and Last name)")
                    .font(.custom_font(.regular, size: 16))
                
                TextField("Full name (First and Last name)", text: $fullName)
                    .placeholder(when: fullName.isEmpty){
                    }
                    .padding()
                    .frame(width: textFeildWidth,height: textFeildHeight)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1))
                Text("Email")
                    .font(.custom_font(.regular, size: 16))

                TextField("Email", text: $email)
                    .placeholder(when: email.isEmpty){
                    }
                    .padding()
                    .frame(width: textFeildWidth,height: textFeildHeight)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1))
            Group{
                Text("Mobile number")
                    .font(.custom_font(.regular, size: 16))

                TextField("Mobile number", text: $phoneNumber)
                    .placeholder(when: phoneNumber.isEmpty){
                    }
                    .padding()
                    .frame(width: textFeildWidth,height: textFeildHeight)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1))
            }
            
            Group{
                Text("Full Address")
                    .font(.custom_font(.regular, size: 16))

                TextField("Full Address", text: $fullAddress)
                    .placeholder(when: fullAddress.isEmpty){
                    }
                    .padding()
                    .frame(width: textFeildWidth,height: textFeildHeight)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1))
            }
            HStack{
                VStack(alignment: .leading){
                    Text("Country/Region")
                        .font(.custom_font(.regular, size: 16))

                    TextField("Country/Region", text: $country)
                        .placeholder(when: country.isEmpty){
                        }
                        .padding()
                        .frame(width: _textFeildWidth_small,height: textFeildHeight)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1))
                }
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Town/City")
                        .font(.custom_font(.regular, size: 16))

                    TextField("Town/City", text: $city)
                        .placeholder(when: city.isEmpty){
                            
                        }
                        .padding()
                        .frame(width: _textFeildWidth_small,height: textFeildHeight)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1))
                }
                
            }
            
            HStack{
                VStack(alignment: .leading){
                    Text("State")
                        .font(.custom_font(.regular, size: 16))

                    
                    TextField("State", text: $state)
                        .placeholder(when: state.isEmpty){
                        }
                        .padding()
                        .frame(width: _textFeildWidth_small,height: textFeildHeight)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1))
                }
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Pincode")
                        .font(.custom_font(.regular, size: 16))

                    TextField("Pincode", text: $pincode)
                        .placeholder(when: pincode.isEmpty){
                        }
                        .padding()
                        .frame(width: _textFeildWidth_small,height: textFeildHeight)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1))
                }
                
            }
            
        }
        .padding([.horizontal,.vertical])
    }

    var viewSavedAddress: some View {
        
        VStack{
            addressCollection
        }
    }
    
    var addressCollection : some View{
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [
                GridItem(.flexible(), alignment: .top)
            ]) {
                ForEach(self.arrAddress, id: \.id) { _address in
                    AddressRow(address: _address, widthFrame: viewWidth - 20, heightFrame: 150)
                }
            }
        }
//        .background(Color.yellow)
        .padding([.leading,.trailing],5)
    }
    
}

#Preview {
    AddressShippingV()
}






struct CustomTab_address: View {
    var label: String
    @Binding var selectedTab: Tab_address
    var tab: Tab_address
    var animationNamespace: Namespace.ID

    var body: some View {
        VStack {
            Text(label)
                .font(.custom_font(.medium,size: 16))
                .foregroundColor(.black)

            if selectedTab == tab {
                Color.themeColor
                    .frame(height: 4)
                    .matchedGeometryEffect(id: "underline", in: animationNamespace)
            } else {
                Color.clear.frame(height: 4)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedTab = tab
            }
        }
    }
}
