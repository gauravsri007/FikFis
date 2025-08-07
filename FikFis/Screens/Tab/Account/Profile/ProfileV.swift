//
//  ProfileV.swift
//  FikFis
//
//  Created by apple on 26/08/24.
//

import SwiftUI

struct ProfileV: View {
    @State private var phoneNumber_orEmail: String = ""
    @State private var fullName: String = ""
    @State private var email: String = ""

    @State private var password: String = ""
    @State private var navigateToDestination: Bool = false
    @State private var isVisible: Bool = false
    @State private var isFullName: Bool = false
    @State private var showBottomView = false

    var body: some View {
        NavigationHeader(isBellIconHidden: false)
        ScrollView{
            ZStack{
                
                VStack{
                    headerView
                    
                    contentView
                        .padding()
                }
                
                if isVisible {
                    VStack{
                        Text("Hello")
                    }
                    .frame(width: UIScreen.screenWidth,height: UIScreen.screenHeight)
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .zIndex(1)  // Brings this view to the front
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                isVisible = false
                               }
                    )
                }
                
            }
            .sheet(isPresented: $showBottomView) {
                editFullNameView
                    .presentationDetents([.height(appHeight * 0.25)]) // Available in iOS 16+
                    .presentationDragIndicator(.visible)
            }

        }
        .toolbar(.hidden, for: .tabBar)
    }
    
    
    var editFullNameView: some View {
        return VStack(alignment: .leading ){
                Spacer()
                LazyVStack(alignment: .leading){
                    Text("Enter your name")
                        .font(.custom_font(.bold,size: 18))
                        .padding(.bottom)
                    
                    TextField("", text: $fullName)
                        .placeholder(when: fullName.isEmpty){
                        }
                        .frame(height:textFieldHeight)
                    
                        .padding()
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1))
                    //----------------------------------------------------------------------
                        .padding(.bottom)
      
                    HStack{
                        Spacer()
                        Button{
                            showBottomView.toggle()
                        } label:{
                            Text("Cancel")
                                .foregroundColor(.white)
                                .bold()
                                .frame(width: appWidth / 5)
                                .frame(height:12)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(buttonCornerRadius, corners: .allCorners)
                            
                        }
//                        .padding()
                        
                        Button{
                            //                        self.isLogin = true
                        } label:{
                            Text("Save")
                                .foregroundColor(.black)
                                .bold()
                                .frame(width: appWidth / 5)
                                .frame(height:12)
                                .padding()
                                .background(Color.theme)
                                .cornerRadius(buttonCornerRadius, corners: .allCorners)
                            
                        }
//                        .padding()
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal)
            }
            .frame(width: appWidth, height: appHeight * 0.25)
            .background(Color.white)
            .cornerRadius(8)

    }
    
    var contentView:some View{
        var textViewHeight : CGFloat = 45
        return VStack(alignment: .leading) {
            Text("Full Name")
                .font(.custom_font(.medium, size: 18))
            HStack{
                TextField("Full Name", text: $phoneNumber_orEmail)
                    .placeholder(when: phoneNumber_orEmail.isEmpty){
                    }
                    .padding()
                    .frame(width: UIScreen.screenWidth - 90,height: textViewHeight)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1))
                Button{
                    isFullName = true
                    withAnimation {
                        showBottomView.toggle()
                    }
                }
                label:{
                    Image(systemName: "pencil")
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.white)
                        .padding()
                        .background {
                            Color.themeColor
                        }
                        .clipShape(Circle())
                }
                
            }
            
            Text("Email")
                .font(.custom_font(.medium, size: 18))
            HStack{
                
                TextField("Email", text: $phoneNumber_orEmail)
                    .placeholder(when: phoneNumber_orEmail.isEmpty){
                    }
                    .padding()
                    .frame(width: UIScreen.screenWidth - 90,height: textViewHeight)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1))
                //                ForwardButton(imageName: "pencil", size: 20)
                
            }
            Text("Mobile or Phone Number")
                .font(.custom_font(.medium, size: 18))
            HStack{
                
                TextField("Mobile or Phone Number", text: $phoneNumber_orEmail)
                    .placeholder(when: phoneNumber_orEmail.isEmpty){
                    }
                    .padding()
                    .frame(width: UIScreen.screenWidth - 90,height: textViewHeight)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1))
                //                ForwardButton(imageName: "pencil", size: 20)
            }
            
            Text("If you want to change your password click on change password.")
                .font(.custom_font(.regular, size: 16))
                .padding()
            HStack{
                
                Text("Change Password")
                    .font(.custom_font(.medium, size: 18))
                    .overlay(
                        Rectangle()
                            .fill(Color.theme)
                            .frame(height: 4)
                            .offset(y:  10)
                        , alignment: .bottom
                    )
                
                //            HeaderLabel(header: "Change Password")
                //                .font(.custom_font(.medium, size: 18))
                
                Spacer()
                ForwardButton(imageName: "pencil", size: 20, action: {
                    print("SGKJSDFHLKSDF")
                    navigateToDestination = true
                }, destination: CreatePasswordV())
                .navigationDestination(isPresented: $navigateToDestination) {
                    ChangePasswordV()
                }
                                
            }
            
        }
        
    }
    
    func editNameView(title:String) ->some View{
        ZStack{
            VStack{
                Text("Enter ")
                
            }
            }
        .frame(width: UIScreen.screenWidth,height: UIScreen.screenHeight)
        .background(Color.yellow)
        .opacity(isVisible ? 1 : 0)

    }
    
    var headerView:some View{
        HStack{
            ZStack{
                Image("product")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 100)
                    .clipShape(.circle)
//                    .padding()
                    .overlay(alignment: .bottomTrailing){
                        Button(action: {
                            
                        }, label: {
                            Image("camera")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30,height: 30)
                                .clipShape(.circle)
                        })
                        .alignmentGuide(.top) { dim in
                            dim.height / 2
                        }
                        .alignmentGuide(.trailing) { dim in
                            dim.width / 2
                        }
//                        .border(Color.gray, width: 1)
                        .background(Color.themeColor)
                    }

            }
            .padding([.leading,.trailing])

            VStack(alignment: .leading){
                Text("Name")
                    .font(.custom_font(.medium,size: 20))
                Text("Gmail.com")
                    .font(.custom_font(.medium,size: 20))

            }
            Spacer()
        }
    }
}

#Preview {
    ProfileV()
}
