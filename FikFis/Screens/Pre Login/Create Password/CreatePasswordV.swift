//
//  CreatePasswordV.swift
//  FikFis
//
//  Created by apple on 03/08/24.
//

import SwiftUI

struct CreatePasswordV: View {
    
    @StateObject private var viewModel = CreatePasswordVM()
    @State var phoneNumber_orEmail: String = ""
    @State private var password: String = ""
    @State var otpKey: String = ""
    @State private var confirmPassword: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    let leadingSpace : CGFloat = 5
    @Environment(\.dismiss) var dismiss
    @State private var navigateToLoginScreen: Bool = false
    @State private var showToast: Bool = false
    @State var toastMessage: String = ""
    
    var body: some View {
        
        ZStack{
            LazyVStack(alignment: .leading) {
                Group(){
                    LazyVStack(alignment: .leading) {
                        HeaderLabel(header: "Create Password")
                        
                        Spacer()
                        Text("Your password must be a minimum of 6 characters long.")
                            .font(.custom_font(.medium,size: 18))
                    }
                    .padding([.leading],leadingSpace)
                    
                }
                .padding()
                Group(){
                    LazyVStack(alignment: .leading){
                        Group {
                            //----------------------------------------------------------------------
                            Text("New Password")
                                .font(.custom_font(.regular,size: 16))
                            
                            TextField("", text: $password)
                                .placeholder(when: password.isEmpty){
                                }
                                .frame(height:textFieldHeight)
                            
                                .padding()
                            
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.gray, lineWidth: 1))
                            //----------------------------------------------------------------------
                                .padding(.bottom)
                            //----------------------------------------------------------------------
                            Text("Confirm Password")
                                .font(.custom_font(.regular,size: 16))
                            
                            TextField("", text: $confirmPassword)
                                .placeholder(when: confirmPassword.isEmpty) {
                                }
                                .frame(height:textFieldHeight)
                            
                                .padding()
                            
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.gray, lineWidth: 1))
                            
                        }
                        Spacer()
                    }
                    .padding([.leading],leadingSpace)
                    
                }
                .padding()
                Button{
                    if password == ""{
                        GlobalFunction.shared.showAlert_banner(msg: "New Password cannot empty.", bgColor: UIColor.red, type: .fail)
                    }
                    else if password.count < 6{
                        GlobalFunction.shared.showAlert_banner(msg: "Password must be atleast 6 digit.", bgColor: UIColor.red, type: .fail)
                    }
                    else if confirmPassword == ""{
                        GlobalFunction.shared.showAlert_banner(msg: "Confirm Password cannot empty.", bgColor: UIColor.red, type: .fail)
                    }
                    else if confirmPassword.count < 6{
                        GlobalFunction.shared.showAlert_banner(msg: "Password must be atleast 6 digit.", bgColor: UIColor.red, type: .fail)
                    }
                    else if confirmPassword != password{
                        GlobalFunction.shared.showAlert_banner(msg: "password and confirm password must be same.", bgColor: UIColor.red, type: .fail)
                    }
                    else{
//                        self.viewModel.forgotPasswordAPI(userName: phoneNumber_orEmail,password: password,otp_key: otpKey) { result,statusCode  in
//                            switch result {
//                            case .success(let response):
//                                guard let dataValue : CreatePasswordResponse = response as? CreatePasswordResponse else{
//                                    return
//                                }
//                                print("statusCode: \(statusCode)")
//                                if statusCode == 200 || statusCode == 201{
//                                    self.toastMessage = dataValue.message ?? "OTP validated successfully."
//                                    self.showToastMessage()
//                                    self.navigateToLoginScreen = true
//                                    print("Success: \(String(describing: response.message))")
//                                }
//                                if statusCode == 400{
//                                    GlobalFunction.shared.showAlert_banner(msg:dataValue.messages?.password ?? "error", bgColor: UIColor.red, type: .fail)
//                                }
//                            case .failure(let error):
//                                print("Failed with error: \(error.localizedDescription)")
//                            }
//                        }
                    }
                }
                label: {
                    Text("Submit")
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
                .navigationDestination(isPresented: $navigateToLoginScreen, destination: {
                    LoginV()
                })
                
            }
            
            if showToast {
                ToastView(message: toastMessage)
                    .transition(.opacity)
                    .zIndex(1) // Ensure it's above other views
            }
        }//LazyStack
        Spacer()

    }
    
    // Function to show toast and hide it after a delay
    private func showToastMessage() {
        withAnimation {
            showToast = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Auto-hide after 2 seconds
            withAnimation {
                showToast = false
            }
        }
    }

}

#Preview {
    CreatePasswordV()
}
