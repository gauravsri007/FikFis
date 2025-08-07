//
//  SignUpV.swift
//  FikFis
//
//  Created by apple on 03/08/24.
//

import SwiftUI

struct SignUpV: View {
    
    @StateObject private var viewModel = SignUpVM()
    @State var userDetailsM: SignUpM?
    @State private var phoneNumber_orEmail: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var isSignup = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    @Environment(\.dismiss) var dismiss
    
    @State private var navigateToOTPScreen: Bool = false
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            LazyVStack(alignment: .leading) {
                HeaderLabel(header: "Sign Up")

                Spacer()
                Text("Sign up with your mobile number to get started")
                    .font(.custom_font(.medium,size: 18))
            }
            .padding([.leading],leadingSpace)
            
            LazyVStack(alignment: .leading){
                Group {                     //----------------------------------------------------------------------
                    Text("Email or mobile phone number")
                        .font(.custom_font(.regular,size: 16))
                    
                    TextField("Email or mobile phone number", text: $phoneNumber_orEmail)
                        .placeholder(when: phoneNumber_orEmail.isEmpty){
                        }
                    
                        .padding()
                        .keyboardType(.emailAddress)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1))
                    //----------------------------------------------------------------------
                        .padding(.bottom)
                    //----------------------------------------------------------------------
                    Text("Password")
                        .font(.custom_font(.regular,size: 16))
                    
                    SecureField("xxxxxxxxxxx", text: $password)
                        .padding()
                        .keyboardType(.emailAddress)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1))
                    //----------------------------------------------------------------------
                }
                .padding([.leading],leadingSpace)
                
            }
            .padding(.bottom)

            Button(action: {
                if phoneNumber_orEmail == ""{
                    GlobalFunction.shared.showAlert_banner(msg: "Mobile number cannot empty.", bgColor: UIColor.red, type: .fail)
                }
                else if phoneNumber_orEmail.count < 10{
                    GlobalFunction.shared.showAlert_banner(msg: "Mobile number must be 11 digit.", bgColor: UIColor.red, type: .fail)
                }
                else if password.isEmpty || password == ""{
                    GlobalFunction.shared.showAlert_banner(msg: "Password cannot be empty.", bgColor: UIColor.red, type: .fail)
                }
                else if password.count < 8{
                    GlobalFunction.shared.showAlert_banner(msg: "Password must be at least 8 characters.", bgColor: UIColor.red, type: .fail)
                }
                else{
                    self.viewModel.registerUserOTP(username: phoneNumber_orEmail) { result,statusCode  in
                        switch result {
                        case .success(let response):
                            guard let dataValue : DefaultResponse = response as? DefaultResponse else{
                                return
                            }
                            print("statusCode: \(statusCode)")
                            if statusCode == 200 || statusCode == 201{
                                self.navigateToOTPScreen.toggle()
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
                
            }, label: {
                Text("Continue")
                    .foregroundColor(.black)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(content: {
                        RoundedRectangle(cornerRadius: buttonCornerRadius)
                            .foregroundColor(Color.theme)
                    })
            })
            .padding(.bottom)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
            }
            .navigationDestination(isPresented: $navigateToOTPScreen, destination: {
                OtpV(phoneNumber_orEmail: phoneNumber_orEmail,password: password,isfromPasswordAssistance:false)
            })
            
            LazyVStack(alignment: .leading){
                Text("By continuing, you agree to FikFis Terms of Use and Privacy Policy.")
                    .font(.custom_font(.regular,size: 14))
                    .padding(.bottom)
                
                Text("To verify your number, we will send you a text message with a temporary code.")
                    .font(.custom_font(.regular,size: 14))
            }
            .padding(.bottom)

            LazyVStack(alignment: .center){
                HStack(){
                    Text("Already have an account?")
                    Button{
                        dismiss()
                    } label: {
                        Text("Login")
                            .font(.custom_font(.medium,size: 15))
                            .foregroundColor(.black)
                        
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                    }
                    
                }
            }
        }
        .padding()
        Spacer()
    }
    
}

#Preview {
    SignUpV()
}
