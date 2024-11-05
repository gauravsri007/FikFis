//
//  ContentView.swift
//  FikFis
//
//  Created by apple on 31/07/24.
//

import SwiftUI
import PagerTabStripView

struct ContentView: View {
    @State private var navigateLoginView = true
    @State var isActive : Bool = false
    var body: some View {
//        NavigationStack {
//            Group {
//                if self.isActive{
//                    
//                }
//                else{
//                    Image("splash")
//                        .scaledToFill()
//                        .ignoresSafeArea()
//                }
//            }
//            .padding()
//
//        }
//        .navigationDestination(isPresented: $navigateLoginView, destination: {
//            LoginV()
//                .ignoresSafeArea()
//        })
        PagerTabStripView() {
            SupportV()
                .pagerTabItem(tag: 1) {
                    Text("Tab 1")
                }
            LoginV()
                .pagerTabItem(tag: 2) {
                    Text("Tab 2")
                }
        }
        .pagerTabStripViewStyle(.scrollableBarButton(
            padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
            indicatorView: { Rectangle().fill(Color.themeColor).cornerRadius(5).frame(height: 5).padding(.top, -8) }
        ))
        .frame(width: appWidth)
        
    }
}

#Preview {
    ContentView()
}
