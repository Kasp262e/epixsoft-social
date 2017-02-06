//
//  SignInVC.swift
//  epixsoft social
//
//  Created by Kasper Hansen on 04/02/2017.
//  Copyright © 2017 EpixSoft. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnPressed(_ sender: UIButton) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            
            if error != nil {
                print("*Kasper*: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("*Kasper*: User cancelled Facebook authentication")
            } else {
                print("*Kasper*: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("*Kasper*: Unable to authenticate with Firebase - \(error)")
            } else {
                print("*Kasper*: Successfully authenticated with Firebase")
            }
        })
    }

}

