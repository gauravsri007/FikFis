//
//  PasswordAssistanceV.swift
//  FikFis
//
//  Created by apple on 03/08/24.
//

import SwiftUI

struct PasswordAssistanceV: View {
    
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
                        Text("Password Assistance")
                            .font(.custom_font(.medium,size: 24))
                            .underline(true,color: .yellow)
                        Spacer()
                        Text("No problem! Just enter your email or mobile number, and we’ll send you a text message with a temporary code.")
                            .font(.custom_font(.medium,size: 18))
                    }
                    .padding([.leading],leadingSpace)
                    
                }
                .padding()
                Group(){
                    LazyVStack(alignment: .leading){
                        Group {                     //----------------------------------------------------------------------
                            Text("Email or mobile phone number")
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
                            //----------------------------------------------------------------------
                        }
                        Spacer()
                        
                    }
                    .padding([.leading],leadingSpace)
                    
                }
                .padding()
                LazyVStack(alignment: .leading){
                    
                    NavigationLink(destination: OtpV()){
                        Text("Verify mobile number")
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(content: {
                                RoundedRectangle(cornerRadius: buttonCornerRadius)
                                    .foregroundColor(Color.theme)
                            })
                    }
                    .foregroundColor(.themeColor)
                    .padding()
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                    }
                    
                }
                .padding([.leading],leadingSpace)
                
                //----------------------------------------------------------------------
                Group{
                    Text(".To verify your number, we will send you a text message with a temporary code. ")
                        .padding()
                    
                    HStack{
                        Spacer()
                        Text("Need help?")
                            .font(.custom_font(.regular,size: 15))
                        
                        Button{
                            
                        }
                    label: {
                        Text("support@fikfis.uk")
                            .font(.custom_font(.regular,size: 15))
                            .foregroundColor(.black)
                        
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                    }
                        Spacer()
                        
                    }
                    
                }
                .padding([.leading],leadingSpace)
                
            }
            
            Spacer()
        }//LazyStack
    }
    
}

#Preview {
    PasswordAssistanceV()
}
