//
//  OtpV.swift
//  FikFis
//
//  Created by apple on 03/08/24.
//

import SwiftUI

struct OtpV: View {
    
    @State private var phoneNumber_orEmail: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    let leadingSpace : CGFloat = 5
    var body: some View {
        
        Group{
            LazyVStack(alignment: .leading) {
                LazyVStack(alignment: .leading){
                    Text("Temporary Code (OTP)")
                        .font(.custom_font(.medium,size: 24
                                          ))
                        .underline(true,color: .yellow)
                        .padding([.bottom],5)

                    Text("Just send a text message with a temporary code.")
                        .font(.custom_font(.medium,size: 18))
                }
                .padding([.horizontal,.bottom])

                LazyVStack(alignment: .leading){
                    Group {
                        Text("temporary code (OTP)")
                            .font(.custom_font(.regular,size: 16))
                        TextField("Email or mobile phone number", text: $phoneNumber_orEmail)
                            .placeholder(when: phoneNumber_orEmail.isEmpty){
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))
                        Spacer()
                    }
                    
                }
                .padding([.horizontal,.top])


                NavigationLink(destination: CreatePasswordV()){
                    Text("Submit")
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
                
                //----------------------------------------------------------------------
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
                Spacer()
            }
            Spacer()
        }//LazyStack
    }
    
}

#Preview {
    OtpV()
}
