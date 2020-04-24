//
//  DetailView.swift
//  Hacker News
//
//  Created by Andres Felipe De La Ossa Navarro on 4/10/20.
//  Copyright © 2020 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url:String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}



