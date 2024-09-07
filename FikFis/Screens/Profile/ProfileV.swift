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
    
    var body: some View {
        NavigationHeader(isBellIconHidden: false)
        ScrollView{
            VStack{
                headerView
                
                contentView
                    .padding()
                
                RoundedButton(showingAlert: false, alertTitle: "", alertMessage: "", btnTitle: "SAVE CHANGES", btnHeight: 50, btnWidth: UIScreen.screenWidth - 30, font: .custom_font(.medium,size: 20))
            }
        }
    }
    
    var contentView:some View{
        var textViewHeight : CGFloat = 45
        return VStack(alignment: .leading) {
            Text("Your Orders")
                .font(.custom_font(.medium, size: 28))
            Rectangle()
                .foregroundStyle(Color.themeColor)
                .frame(width: 100, height: 5)
//                .padding(.leading)
                .padding(.top, -20)
            
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
                ForwardButton(imageName: "pencil", size: 20)

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
                ForwardButton(imageName: "pencil", size: 20)

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
                ForwardButton(imageName: "pencil", size: 20)
            }
            
            Text("Password")
                .font(.custom_font(.medium, size: 18))
            HStack{
            TextField("Password", text: $phoneNumber_orEmail)
                .placeholder(when: phoneNumber_orEmail.isEmpty){
                }
                .padding()
                .frame(width: UIScreen.screenWidth - 90,height: textViewHeight)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray, lineWidth: 1))
            ForwardButton(imageName: "pencil", size: 20)

        }
            
        }
        
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
                        .border(Color.gray, width: 1)
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
