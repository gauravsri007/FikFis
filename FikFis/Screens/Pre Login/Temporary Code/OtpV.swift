//
//  OtpV.swift
//  FikFis
//
//  Created by apple on 03/08/24.
//

import SwiftUI

struct OtpV: View {
    @StateObject private var viewModel = OtpVM()
    @State var phoneNumber_orEmail:String = ""
    @State var password: String = ""
    @State private var otpValue: String = ""
    @State private var otpKey: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    @State private var navigateToHomeScreen: Bool = false
    @State private var navigateToCreatePswdScreen: Bool = false

    @State var isfromPasswordAssistance: Bool = false

    let leadingSpace : CGFloat = 5
    var body: some View {
        Group{
            LazyVStack(alignment: .leading) {
                LazyVStack(alignment: .leading){
                    HeaderLabel(header: "Temporary Code (OTP)")

                    Text("Just send a text message with a temporary code.")
                        .font(.custom_font(.medium,size: 18))
                }
                .padding([.horizontal,.bottom])

                LazyVStack(alignment: .leading){
                    Group {
                        Text("temporary code (OTP)")
                            .font(.custom_font(.regular,size: 16))
                        TextField("", text: $otpValue)
                            .placeholder(when: otpValue.isEmpty){
                            }
                            .frame(height:textFieldHeight)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 1))
                        Spacer()
                    }
                    
                }
                .padding([.horizontal,.top])
                
                Button(action: {
                    if isfromPasswordAssistance{
                        if phoneNumber_orEmail == ""{
                            GlobalFunction.shared.showAlert_banner(msg: "OTP cannot empty.", bgColor: UIColor.red, type: .fail)
                        }
                        else{
                            print("otpValue \(otpValue)")
                            self.viewModel.otpValidationAPI(userName: phoneNumber_orEmail, otp: otpValue) { result, statusCode in
                                switch result {
                                case .success(let response):
                                    guard let dataValue : OtpValidationResponse = response as? OtpValidationResponse else{
                                        return
                                    }
                                    if statusCode == 200 || statusCode == 201{
                                        otpKey = dataValue.otp_key ?? ""
                                        self.navigateToCreatePswdScreen.toggle()
                                        print("Success: \(String(describing: response.message))")
                                    }
                                    if statusCode == 400{
                                        GlobalFunction.shared.showAlert_banner(msg:dataValue.message ?? "Error", bgColor: UIColor.red, type: .fail)
                                    }
                                case .failure(let error):
                                    print("Failed with error: \(error.localizedDescription)")
                                }
                            }
                        }
                    }
                    else{
                        if phoneNumber_orEmail == ""{
                            GlobalFunction.shared.showAlert_banner(msg: "OTP cannot empty.", bgColor: UIColor.red, type: .fail)
                        }

                        else{
                            print("otpValue \(otpValue)")
                            self.viewModel.registerUserAPI(userName: phoneNumber_orEmail, password: password, otp: otpValue) { result, statusCode in
                                switch result {
                                case .success(let response):
                                    guard let dataValue : LoginResponse = response as? LoginResponse else{
                                        return
                                    }
                                    
                                    if statusCode == 200 || statusCode == 201{
                                        GlobalFunction.shared.storeLocalData(dataValue)
                                        self.navigateToHomeScreen.toggle()
                                        print("Success: \(String(describing: response.message))")
                                    }
                                    if statusCode == 400{
                                        GlobalFunction.shared.showAlert_banner(msg:dataValue.message ?? "Error", bgColor: UIColor.red, type: .fail)
                                    }
                                case .failure(let error):
                                    print("Failed with error: \(error.localizedDescription)")
                                }
                            }
                        }
                    }
                    
            }, label: {
                    Text("Submit")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.theme)
                        .cornerRadius(buttonCornerRadius, corners: .allCorners)
            })
                .foregroundColor(.themeColor)
                .padding()
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                }
                .navigationDestination(isPresented: $navigateToHomeScreen, destination: {
                    TabV()
                })
                .navigationDestination(isPresented: $navigateToCreatePswdScreen, destination: {
                    CreatePasswordV(phoneNumber_orEmail: phoneNumber_orEmail, otpKey: otpKey)
                })
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
