//
//  Terms&ConditionV.swift
//  FikFis
//
//  Created by apple on 31/08/24.
//

import SwiftUI
import WebKit


struct Terms_ConditionV: View {
    @State var header : String = "Terms & Condition"
    @State var content : String = ""

    var body: some View {
        
        NavigationHeader()
        HeaderLabel(header: header)

        WebView()

    }
}

#Preview {
    Terms_ConditionV()
}


struct WebView: UIViewRepresentable {
 
    let webView: WKWebView
    
    init() {
        webView = WKWebView(frame: .zero)
      
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        webView.load(URLRequest(url: URL(string: "https://google.com")!))
    }
}
