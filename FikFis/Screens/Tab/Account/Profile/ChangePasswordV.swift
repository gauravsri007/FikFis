//
//  ChangePasswordV.swift
//  FikFis
//
//  Created by apple on 04/11/24.
//

import SwiftUI

struct ChangePasswordV: View {
    
    @State private var phoneNumber_orEmail: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    let leadingSpace : CGFloat = 5
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        Group{
        LazyVStack(alignment: .leading) {
            Group(){
                LazyVStack(alignment: .leading) {
                    HeaderLabel(header: "Change Password")

                    Spacer()
                    Text("Set up your new password")
                        .font(.custom_font(.medium,size: 18))
                }
                    .padding([.leading],leadingSpace)

            }
            .padding()
            Group(){
                LazyVStack(alignment: .leading){
                    Group {                     //----------------------------------------------------------------------
                        Text("Old Password")
                            .font(.custom_font(.regular,size: 16))
                        
                        
                        TextField("Email or mobile phone number", text: $phoneNumber_orEmail)
                            .placeholder(when: phoneNumber_orEmail.isEmpty){
                            }
                            .frame(height:textFieldHeight)

                            .padding()
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))
                        //----------------------------------------------------------------------
                            .padding(.bottom)
                        //----------------------------------------------------------------------
                        Text("New Password")
                            .font(.custom_font(.regular,size: 16))
                        
                        TextField("xxxxxxxxxxx", text: $phoneNumber_orEmail)
                            .placeholder(when: phoneNumber_orEmail.isEmpty) {
                            }
                            .frame(height:textFieldHeight)

                            .padding()
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))
                        
                        //----------------------------------------------------------------------
                        Text("Confirm Password")
                            .font(.custom_font(.regular,size: 16))
                        
                        TextField("xxxxxxxxxxx", text: $phoneNumber_orEmail)
                            .placeholder(when: phoneNumber_orEmail.isEmpty) {
                            }
                            .frame(height:textFieldHeight)

                            .padding()
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))
  
                    }
                    Spacer()
                }
                .padding([.leading],leadingSpace)

            }
            .padding()
            NavigationLink(destination: LoginV()){
            Text("Save")
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.theme)
                .cornerRadius(buttonCornerRadius, corners: .allCorners)
            }
        .foregroundColor(.themeColor)
        .padding()
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
        }
            
        }
            
        Spacer()
        }//LazyStack
    }

}

#Preview {
    ChangePasswordV()
}
