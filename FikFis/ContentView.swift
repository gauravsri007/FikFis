//
//  ContentView.swift
//  FikFis
//
//  Created by apple on 31/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var navigateLoginView = true
    @State var isActive : Bool = false
    var body: some View {
        NavigationStack {
            Group {
                if self.isActive{
                    
                }
                else{
                    Image("splash")
                        .scaledToFill()
                        .ignoresSafeArea()
                }
            }
            .padding()

        }
        .navigationDestination(isPresented: $navigateLoginView, destination: {
            LoginV()
                .ignoresSafeArea()
        })
        
    }
}

#Preview {
    ContentView()
}
