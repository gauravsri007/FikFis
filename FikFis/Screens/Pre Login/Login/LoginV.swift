//
//  LoginV.swift
//  FikFis
//
//  Created by apple on 01/08/24.
//

import SwiftUI

struct LoginV: View {
    
    @StateObject private var viewModel = LoginVM()
    @State private var phoneNumber_orEmail: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    @State private var isLogin: Bool = false
    @State private var isSignup: Bool = false
    @State private var showToast: Bool = false
    @State var toastMessage: String = ""

    var body: some View {
        ZStack{
            NavigationStack {
                LazyVStack(alignment: .leading) {
                    LazyVStack(alignment: .leading) {
                        HeaderLabel(header: "Login")
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
                                .frame(height:textFieldHeight)
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
                            
                            SecureField("xxxxxxxxxxx", text: $password)
                                .placeholder(when: password.isEmpty) {
                                }
                                .frame(height:textFieldHeight)
                                .padding()
                                .keyboardType(.emailAddress)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.gray, lineWidth: 1))
                            //----------------------------------------------------------------------
                        }
                        Spacer()
                        HStack{
                            
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
                            self.viewModel.loginAPI(userName: phoneNumber_orEmail, password: password) { result, statusCode in
                                switch result {
                                case .success(let response):
                                    guard let dataValue = response as? LoginResponse else{
                                        return
                                    }
                                    if statusCode == 200 || statusCode == 201{
                                        self.toastMessage = dataValue.message ?? "User logged in successfully"
                                        GlobalFunction.shared.storeLocalData(dataValue)
                                        showToastMessage()
                                        self.isLogin.toggle()
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
                        
                    } label:{
                        Text("Submit")
                            .foregroundColor(.black)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.theme)
                            .cornerRadius(buttonCornerRadius, corners: .allCorners)
                        
                    }
                    .fullScreenCover(isPresented: $isLogin, content: {
                        TabV()
                    })
                    .frame(height:textFieldHeight)
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
            // Toast Overlay
            if showToast {
                ToastView(message: toastMessage)
                    .transition(.opacity)
                    .zIndex(1) // Ensure it's above other views
            }
        }
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
    LoginV()
}



