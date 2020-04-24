//
//  ContentView.swift
//  Hacker News
//
//  Created by Andres Felipe De La Ossa Navarro on 4/10/20.
//  Copyright © 2020 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) {  post in
                NavigationLink(destination: DetailView(url:post.url)) {
                    HStack {
                        HStack {
                            Text(String(post.points))
                            Text("⭐️")
                        }
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("Jaquer nius").accentColor(Color.black)
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Post: Identifiable {
    
    let id: String
    let title:String
}


let posts = [
    Post(id: "1", title: "Hello"),
    Post(id: "2", title: "Hola"),
    Post(id: "3", title: "Bonjour")
]
