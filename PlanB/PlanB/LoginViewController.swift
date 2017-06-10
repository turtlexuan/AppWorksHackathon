//
//  LoginViewController.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/10.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let userManager = UserManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func login(sender: UIButton) {
        
        userManager.login() { result in
            
            switch result {
                
            case true:
                self.performSegue(withIdentifier: "enterMainPage", sender: self)
                
            case false:
                //error handling required//
                print("LoginVC - failed")
            }
        }
    }
}

