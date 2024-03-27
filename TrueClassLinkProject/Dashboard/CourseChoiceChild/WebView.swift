//
//  WebView.swift
//  TrueClassLinkProject
//
//  Created by Apprenant65 on 14/03/2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

var body: some View {
    Text("Hello, World!")
}


/*#Preview {
 WebView()
 }*/
