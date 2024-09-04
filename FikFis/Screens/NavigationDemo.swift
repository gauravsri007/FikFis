//
//  NavigationDemo.swift
//  FikFis
//
//  Created by apple on 03/09/24.
//

import SwiftUI

struct NavigationDemo: View {
    @State private var isShowingDetailView = false
    @State private var showingAlert = false
    @State private var alertTitle: String = "Important message"
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
                   VStack {
                       NavigationLink(destination: LoginV(), isActive: $isShowingDetailView) { }

//                       Button("Tap to show detail") {
//                           isShowingDetailView = true
//                       }
                       Button{
                           isShowingDetailView = true
                       }
                   label: {
                       Text("Sign Up")
                           .font(.custom_font(.medium,size: 15))
                           .foregroundColor(.black)
                       
                   }
                   .alert(isPresented: $showingAlert) {
                       Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                   }

                       
                   }
                   .navigationTitle("Navigation")
               }
    }
}

#Preview {
    NavigationDemo()
}
