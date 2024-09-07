//
//  AddAddress.swift
//  FikFis
//
//  Created by apple on 27/08/24.
//

import SwiftUI

struct AddAddress: View {
    @State private var phoneNumber: String = ""
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullAddress: String = ""
    @State private var country: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var pincode: String = ""
    let textFeildHeight:CGFloat = 50
    let textFeildWidth:CGFloat = appWidth - 24
    
    var body: some View {
        NavigationHeader(isBellIconHidden: false)

        VStack(alignment: .leading){
            
            ScrollView{
                HeaderLabel(header: "Add Addresses")
                
                
                allContent
                
                RoundedButton(showingAlert: false, alertTitle: "", alertMessage: "", btnTitle: "SAVE ADDRESS", btnHeight: 50, btnWidth: UIScreen.screenWidth - 30, font: .custom_font(.medium,size: 20))
            }
        }
        
    }
    
    var allContent : some View{
        let _textFeildWidth_small = (appWidth / 2) - 40
        
        return VStack(alignment: .leading) {
            Group{
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
            }
            Group{
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
            }
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
}

#Preview {
    AddAddress()
}
