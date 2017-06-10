//
//  User.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/10.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import UIKit

class User {
    
    let id: String
    let name: String
    let email: String
    let profilePic: UIImage?
    
    convenience init?(json: Any) {
    
        guard let dictionary = json as? [String : Any]
            else { return nil }
    
        self.init(dictionary: dictionary)
    }
    
    init?(dictionary: [String : Any]) {
        
        guard let name = dictionary["name"] as? String,
            let email = dictionary["email"] as? String,
            let id = dictionary["id"] as? String
            else { return nil }
        self.name = name
        self.id = id
        self.email = email
        
        do {
        guard
        let picture = dictionary["picture"] as? [String : Any],
            let picData = picture["data"] as? [String : Any],
            let modifiedUrlStr = picData["url"] as? String,
            let url = URL(string: modifiedUrlStr)
            else { return nil }
        
            let data = try Data(contentsOf: url)
            self.profilePic = UIImage(data: data)
            
        } catch let error {
            
            self.profilePic = nil
            print(error)
        }
    }
}
