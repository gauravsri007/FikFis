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
        NavigationStack {
            LazyVStack(alignment: .leading) {
                LazyVStack(alignment: .leading) {
                    Text("Login")
                        .font(.custom_font(.medium,size: 24))
                        .underline(true,color: .yellow)
                    Spacer()
                    Text("Get access to your Orders, Wishlist, and Recommendations.")
                        .font(.custom_font(.medium,size: 18))
                }
                .padding([.horizontal,.bottom])

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
//                            Spacer()
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
                            //                            Button{
                            //
                            //                            } label: {
                            //                                Image(systemName: "checkmark.circle")
                            //                                    .foregroundColor(.black)
                            //                            }
                            //                            .frame(width: 16,height: 16)
                            //                            .alert(isPresented: $showingAlert) {
                            //                                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                            //                            }
                            //                            Text("Remember me")
                            //                                .font(.custom_font(.regular,size: 12))
                            
                            Spacer()
                            NavigationLink(destination: PasswordAssistanceV()){
                                Text("Forgot Password")
                                    .font(.custom_font(.regular,size: 12))
                                    .foregroundColor(.black)
                                
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                            }
                        }//HStack
                    }
                    .padding([.horizontal,.top])

                
                Button{
                    self.isLogin = true
                } label:{
                    Text("Submit")
                        .foregroundColor(.black)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(content: {
                            RoundedRectangle(cornerRadius: buttonCornerRadius)
                                .foregroundColor(Color.theme)
                        })
                }
                .fullScreenCover(isPresented: $isLogin, content: {
                    TabV()
                })
                .padding()
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                }
                
                HStack(alignment:.center){
                    Spacer()

                    Text("Don't Have An Account ?")
                    NavigationLink(destination: SignUpV()) {
                        Text("Sign Up")
                            .font(.custom_font(.medium,size: 15))
                            .foregroundColor(.black)
                        
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                            }
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            Spacer()

        }
        .navigationBarHidden(true)
    }
    
}

#Preview {
    LoginV()
}



