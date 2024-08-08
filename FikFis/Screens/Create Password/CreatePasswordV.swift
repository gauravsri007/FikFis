//
//  CreatePasswordV.swift
//  FikFis
//
//  Created by apple on 03/08/24.
//

import SwiftUI

struct CreatePasswordV: View {
    
    @State private var phoneNumber_orEmail: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    let leadingSpace : CGFloat = 5

    var body: some View {
        
        Group{
        LazyVStack(alignment: .leading) {
            Group(){
                LazyVStack(alignment: .leading) {
                    
                    Text("Create Password")
                        .font(.custom_font(.medium,size: 26))
                        .underline(true,color: .yellow)
                    Spacer()
                    Text("Your password must be a minimum of 6 characters long.")
                        .font(.custom_font(.medium,size: 20))
                }
                    .padding([.leading],leadingSpace)

            }
            .padding()
            Group(){
                LazyVStack(alignment: .leading){
                    Group {                     //----------------------------------------------------------------------
                        Text("New Password")
                            .font(.custom_font(.regular,size: 16))
                        
                        
                        TextField("Email or mobile phone number", text: $phoneNumber_orEmail)
                            .placeholder(when: phoneNumber_orEmail.isEmpty){
                            }
                        
                            .padding()
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))
                        //----------------------------------------------------------------------
                        Spacer()
                            .padding(.bottom)
                        //----------------------------------------------------------------------
                        Text("Confirm Password")
                            .font(.custom_font(.regular,size: 16))
                        
                        TextField("xxxxxxxxxxx", text: $phoneNumber_orEmail)
                            .placeholder(when: phoneNumber_orEmail.isEmpty) {
                            }
                        
                            .padding()
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))
                        //----------------------------------------------------------------------
                    }
                    Spacer()
                }
                .padding([.leading],leadingSpace)

            }
            .padding()
            Button{
                
            }
        label:{
            Text("Submit")
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(content: {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundColor(Color.theme)
                })
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
    CreatePasswordV()
}
