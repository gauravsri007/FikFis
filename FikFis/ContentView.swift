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
                    if let isLoggedIn = Udefault.value(forKey: KEY_IS_LOGGEDIN) as? Bool {
                        if isLoggedIn {
                            TabV()
                        }
                        else {
                            LoginV()
                        }
                    }
                    else{
                        LoginV()
                    }
                }
                else{
                    Image("splash")
                        .scaledToFill()
                        .ignoresSafeArea()
                        .onAppear {
                            // Delay before transitioning
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation {
                                    isActive = true
                                }
                            }
                        }
                    
                }
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}


