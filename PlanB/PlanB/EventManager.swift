//
//  EventManager.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/10.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import Foundation
import Alamofire

class EventManager {
    
    static let shared = EventManager()
    
    typealias getResultSuccess = ([[String : Any]]) -> Void
    typealias getResultFailed = () -> Void
    func getMyActivity(success: @escaping getResultSuccess, failed: @escaping getResultFailed) {
        
        Alamofire
            .request(Constants.baseUrlStr + "user/:id", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseJSON { response in
         
                switch response.result {
                    
                case .success(let value):
                    guard let value = value as? [String : Any],
                        value["status"] as? Int == 0
                        else { failed(); return }
                    
                    let activities = value["activity"] as? [[String : Any]] ?? []
                    success(activities)
                    
                case .failure(let error):
                    failed()
                    print(error)
                }
        }
    }
}
