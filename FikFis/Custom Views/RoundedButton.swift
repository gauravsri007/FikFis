//
//  RoundedButton.swift
//  FikFis
//
//  Created by apple on 25/08/24.
//

import SwiftUI

struct RoundedButton: View {
    @State var showingAlert:Bool
    @State var alertTitle: String
    @State var alertMessage: String
    @State var btnTitle: String
    @State var btnHeight: CGFloat
    @State var btnWidth: CGFloat
    @State var font: Font


    var body: some View {
        Button{
            
        }
        label:{
        Text(btnTitle)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .frame(width: btnWidth,height: btnHeight)
            .font(font)
            .background(content: {
                RoundedRectangle(cornerRadius: 26)
                    .foregroundColor(Color.theme)
            })
        }
        .foregroundColor(.themeColor)
        .alert(isPresented: $showingAlert) {
        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
    }
    }
}

#Preview {
    RoundedButton(showingAlert: false, alertTitle: "nope", alertMessage: "no", btnTitle: "Submit",btnHeight: 30,btnWidth: 110, font: .custom_font(.medium,size: 13))
}
