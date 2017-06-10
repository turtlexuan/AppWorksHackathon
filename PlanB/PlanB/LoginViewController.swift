//
//  LoginViewController.swift
//  PlanB
//
//  Created by 王迺瑜 on 2017/6/10.
//  Copyright © 2017年 AppWorksHackathon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var planLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var sloganLabel: UILabel!
    
    let userManager = UserManager.shared
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.userDefault.set("FB_Fake", forKey: "FacebookID")
        
        self.loginButton.layer.cornerRadius = 10
        self.loginButton.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        self.presentLoginButton()
    }
    
    @IBAction func login(_ sender: UIButton) {
        
//        userManager.login() { result in
        
//            switch result {
        
//            case true:
                self.performSegue(withIdentifier: "enterMainPage", sender: self)
                
//            case false:
                //error handling required//
//                print("LoginVC - failed")
//            }
//        }
    }
    
    func presentLoginButton() {
        
        UIView.animate(withDuration: 0.5, animations: {
        
            self.logoImage.frame.origin.y = (self.logoImage.frame.origin.y - 5)
            self.planLabel.frame.origin.y = (self.planLabel.frame.origin.y - 5)
            self.bLabel.frame.origin.y = (self.bLabel.frame.origin.y - 5)
            self.sloganLabel.frame.origin.y = (self.sloganLabel.frame.origin.y + 90)
        
        }) { finished in
        
            UIView.animate(withDuration: 1) {
            
                self.loginButton.alpha = 1
            }
        }
    }
}

