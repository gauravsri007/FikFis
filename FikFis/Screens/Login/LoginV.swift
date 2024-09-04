//
//  LoginV.swift
//  FikFis
//
//  Created by apple on 01/08/24.
//

import SwiftUI

struct LoginV: View {
    
    @State private var phoneNumber_orEmail: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    @State private var isLogin: Bool = false
    @State private var isSignup: Bool = false
    
    let leadingSpace : CGFloat = 5
    
    var body: some View {
        NavigationView {
            LazyVStack(alignment: .leading) {
                Group(){
                    LazyVStack(alignment: .leading) {
                        Text("Login")
                            .font(.custom_font(.medium,size: 26))
                            .underline(true,color: .yellow)
                        Spacer()
                        Text("Get access to your Orders, Wishlist, and Recommendations.")
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
                            
                            Spacer()
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
                        Spacer()
                        HStack{
                            Button{
                                
                            }
                        label: {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.black)
                        }
                        .frame(width: 16,height: 16)
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                        }
                            Text("Remember me")
                                .font(.custom_font(.regular,size: 12))
                            
                            Spacer()
                            Button{
                                
                            }
                        label: {
                            Text("Forgot Password")
                                .font(.custom_font(.regular,size: 12))
                                .foregroundColor(.black)
                            
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                        }
                        }//HStack
                    }
                    .padding([.leading],leadingSpace)
                    
                }
                .padding()
                
                NavigationLink(destination: TabV().toolbarRole(.editor)) {
                    
                    Button{
                        self.isLogin = true
                    } label:{
                        Text("Submit")
                            .foregroundColor(.black)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(content: {
                                RoundedRectangle(cornerRadius: 26)
                                    .foregroundColor(Color.theme)
                            })
                    }
                    .fullScreenCover(isPresented: $isLogin, content: {
                        TabV()
                    })
                    .foregroundColor(.themeColor)
                    .padding()
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                    }
                }
                
                Group{
                    HStack(alignment:.center){
                        Text("Don't Have An Account ?")
                        NavigationLink(destination: SignUpV()) {
                            
//                            Button{
//                                isSignup = true
//                            } label: {
                                Text("Sign Up")
                                    .font(.custom_font(.medium,size: 15))
                                    .foregroundColor(.black)
                                
//                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                            }
                        }
                    }
                }
                .padding()
                
                
            }
        }
        .padding()
    }
    
}

#Preview {
    LoginV()
}



