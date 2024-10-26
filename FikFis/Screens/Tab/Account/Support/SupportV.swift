//
//  SupportV.swift
//  FikFis
//
//  Created by apple on 26/10/24.
//

import SwiftUI

struct SupportV: View {
    
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var mobileNumber: String = ""
    @State private var subject: String = ""
    @State private var message: String = ""

    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    let leadingSpace : CGFloat = 5
    let textFieldHeight: CGFloat = 20
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        NavigationHeader(isBellIconHidden: false)

        ScrollView{
        LazyVStack(alignment: .leading) {
            Group(){
                LazyVStack(alignment: .leading) {
                    HeaderLabel(header: "Support")
                    
                    Spacer()
                    Text("If You Have Any Questions Please Send Us A Message Using The Adjacent Form And We Will Get Back To You As Soon As Possible")
                        .font(.custom_font(.medium,size: 14))
                        .foregroundStyle(Color.gray)
                    
                    Text("Email:")
                        .font(.custom_font(.medium,size: 16))
                    Text("customer care number :")
                        .font(.custom_font(.medium,size: 16))
                    Divider()

                }
                    .padding([.leading],leadingSpace)

            }
            .padding()
            Group(){
                LazyVStack(alignment: .leading){
                    Group {                     //----------------------------------------------------------------------
                        Text("Full name (First and Last name)")
                            .font(.custom_font(.regular,size: 16))
                        
                        
                        TextField("Full name (First and Last name)", text: $fullName)
                            .placeholder(when: fullName.isEmpty){
                            }
                            .frame(height: textFieldHeight)
                            .padding()
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))
                        //----------------------------------------------------------------------
                            .padding(.bottom)
                        //----------------------------------------------------------------------
                        Text("Email")
                            .font(.custom_font(.regular,size: 16))
                        
                        TextField("Email", text: $email)
                            .placeholder(when: email.isEmpty) {
                            }
                            .frame(height: textFieldHeight)

                            .padding()
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))
                        
                        Text("Mobile number")
                            .font(.custom_font(.regular,size: 16))
                        
                        
                        TextField("Mobile number", text: $mobileNumber)
                            .placeholder(when: mobileNumber.isEmpty){
                            }
                            .frame(height: textFieldHeight)

                            .padding()
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))
                        //----------------------------------------------------------------------
                            .padding(.bottom)
                        //----------------------------------------------------------------------
                        Text("Subject")
                            .font(.custom_font(.regular,size: 16))
                        
                        TextField("Subject", text: $subject)
                            .placeholder(when: subject.isEmpty) {
                            }
                            .frame(height: textFieldHeight)

                            .padding()
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))
                        
                        //----------------------------------------------------------------------
                        Text("Write Message")
                            .font(.custom_font(.regular,size: 16))
                        
                        TextEditor(text: $subject)
                            .placeholder(when: subject.isEmpty) {
                            }
                            .frame(height: 80)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))

  
                    }
                }
                .padding([.leading],leadingSpace)

            }
            .padding([.horizontal])
            NavigationLink(destination: LoginV()){
            Text("SAVE")
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
            
        Spacer()
        }//LazyStack
    }

}

#Preview {
    SupportV()
}
