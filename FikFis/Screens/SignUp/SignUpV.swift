//
//  SignUpV.swift
//  FikFis
//
//  Created by apple on 03/08/24.
//

import SwiftUI

struct SignUpV: View {
    
    @State private var phoneNumber_orEmail: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    var body: some View {
        Group{
            LazyVStack(alignment: .leading) {
                Group(){
                    LazyVStack(alignment: .leading) {
                        Text("Sign Up")
                            .font(.custom_font(.medium,size: 26))
                            .underline(true,color: .yellow)
                        Spacer()
                        Text("Sign up with your mobile number to get started")
                            .font(.custom_font(.medium,size: 20))
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
                            Text("Password")
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
                        .padding([.leading],leadingSpace)

                    }
                }
                .padding()
                Button{
                    
                }
            label:{
                Text("Continue")
                    .font(.custom_font(.medium,size: 20))
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(content: {
                        RoundedRectangle(cornerRadius: 26)
                            .foregroundColor(Color.theme)
                    })
            }
            .foregroundColor(.themeColor)
            .padding()
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
            }
                
            }
            Group{
                LazyVStack(alignment: .leading){
                    Text("By continuing, you agree to FikFis Terms of Use and Privacy Policy.")
                        .font(.custom_font(.regular,size: 14))
                        .padding()
                    
                    Text("To verify your number, we will send you a text message with a temporary code.")
                        .font(.custom_font(.regular,size: 14))
                        .padding()
                    
                }
                .padding()
            }
            
            Group{
                HStack(alignment:.center){
                    Text("Already have an account?")
                    Button{
                        
                    }
                label: {
                    Text("Login")
                        .font(.custom_font(.bold,size: 15))
                        .foregroundColor(.black)
                    
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                }
                }
            }
            .padding()
            Spacer()
        }//LazyStack
    }
    
}

#Preview {
    SignUpV()
}
