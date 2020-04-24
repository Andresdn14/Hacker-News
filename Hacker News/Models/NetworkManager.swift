//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Andres Felipe De La Ossa Navarro on 4/10/20.
//  Copyright © 2020 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class NetworkManager:ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(){
        
        Alamofire.request("http://hn.algolia.com/api/v1/search?tags=front_page", method: .get).responseJSON { (response) in
            
            if response.error == nil {
                if let res = response.data {
                    let json = JSON(res)
                    var locaPosts:[Post] = []
                    for post in json["hits"].arrayValue {
                        let post:Post = Post(objectID: post["objectID"].stringValue, points: post["points"].intValue, title: post["title"].stringValue, url: post["url"].string)
                        locaPosts.append(post)
                    }
                    DispatchQueue.main.async {
                       self.posts = locaPosts
                    }
                    
                }
            }
            
        }
    }
    
    
    
    struct Post:Identifiable {
        var id:String {
            return objectID
        }
        let objectID:String
        let points:Int
        let title:String
        let url:String?
    
    }
    
    
}
