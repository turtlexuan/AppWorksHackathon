//
//  LoginManager.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/10.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import Foundation
import FacebookLogin
import FacebookCore

class UserManager {
    
    static let shared = UserManager()
    var user: User?
    
}

extension UserManager {
    
    typealias LoginResult = (Bool) -> Void
    
    func login(loginResult: @escaping LoginResult) {
        
        let loginManager = LoginManager()
        
        loginManager.logIn([.publicProfile, .userFriends, .email], viewController: nil) { result in
            
            switch result {
                
            case .success(grantedPermissions: _, declinedPermissions: _, token: let accessToken):
                
                let request = GraphRequest(graphPath: "me", parameters: ["fields":"email, name, picture"], accessToken: accessToken, httpMethod: .POST, apiVersion: .defaultVersion)
                
                let connection = GraphRequestConnection()
                
                connection.add(request) { (response, result) in
                    
                    switch result {
                        
                    case .success(response: let response):
                        guard let dictionary = response.dictionaryValue else { return }
                        self.user = User(dictionary: dictionary)
                        loginResult(true)
                        
                    case .failed(let error):
                        print("Login - \(error)")
                        loginResult(false)
                    }
                }
                
            case .failed(let error):
                print("Login - \(error)")
                loginResult(false)
                
            case .cancelled:
                print("Login - cancelled")
                loginResult(false)
            }
        }
    }
}
