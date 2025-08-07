//
//  PasswordAssistanceV.swift
//  FikFis
//
//  Created by apple on 03/08/24.
//

import SwiftUI

struct PasswordAssistanceV: View {
    
    @StateObject private var viewModel = PasswordAssistanceVM()
    @State private var phoneNumber_orEmail: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    let leadingSpace : CGFloat = 5
    @State private var navigateToOTPScreen: Bool = false

    var body: some View {
        
        Group{
            LazyVStack(alignment: .leading) {
                Group(){
                    LazyVStack(alignment: .leading) {
                        HeaderLabel(header: "Password Assistance")

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
                                .frame(height:textFieldHeight)

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
                    
                    Button{
                        if phoneNumber_orEmail == ""{
                            GlobalFunction.shared.showAlert_banner(msg: "Mobile number cannot empty.", bgColor: UIColor.red, type: .fail)
                        }
                        else if phoneNumber_orEmail.count < 13{
                            GlobalFunction.shared.showAlert_banner(msg: "Mobile number must be 11 digit.", bgColor: UIColor.red, type: .fail)
                        }
                        else{
                            self.viewModel.forgotPasswordRequest(username: phoneNumber_orEmail) { result,statusCode  in
                                switch result {
                                case .success(let response):
                                    guard let dataValue : DefaultResponse = response as? DefaultResponse else{
                                        return
                                    }
                                    print("statusCode: \(statusCode)")
                                    if statusCode == 200 || statusCode == 201{
                                        self.navigateToOTPScreen = true
                                        print("Success: \(String(describing: response.message))")
                                    }
                                    if statusCode == 400{
                                        GlobalFunction.shared.showAlert_banner(msg:dataValue.messages?.error ?? "error", bgColor: UIColor.red, type: .fail)
                                    }
                                case .failure(let error):
                                    print("Failed with error: \(error.localizedDescription)")
                                }
                            }
                        }
                    }
                label: {
                    Text("Verify mobile number")
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
                    .navigationDestination(isPresented: $navigateToOTPScreen, destination: {
                        OtpV(phoneNumber_orEmail: phoneNumber_orEmail,isfromPasswordAssistance:true)
                    })
                    
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
