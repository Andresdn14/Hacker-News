//
//  WebView.swift
//  Hacker News
//
//  Created by Andres Felipe De La Ossa Navarro on 4/10/20.
//  Copyright © 2020 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI


struct WebView:UIViewRepresentable {
   // typealias UIViewType = WKWebView
    
    
    let urlString:String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = urlString {
            if let url = URL(string: url){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
