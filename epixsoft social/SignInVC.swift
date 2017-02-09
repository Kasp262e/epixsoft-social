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
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: FancyField!
    
    @IBOutlet weak var passField: FancyField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            print("**: Id found in keychain")
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebookBtnPressed(_ sender: UIButton) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("**: Unable to authenticate with Facebook")
            }
            else if result?.isCancelled == true {
                print("**: User cancelled Facebook authentication")
            } else {
                print("**: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("**: Unable to authenticate with Firebase")
            } else {
                print("**: Successfully authenticated with Firebase")
                if let user = user {
                    self.completeSignIn(id: user.uid)
                }
            }
        })
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if let email = emailField.text, let password = passField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("**: Email user authenticated with Firebase")
                    if let user = user {
                        self.completeSignIn(id: user.uid)
                    }
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("**: Unable to authenticate with Firebase using email - \(error)")
                        } else {
                            print("**: Successfully authenticated with Firebase")
                            
                            if let user = user {
                                self.completeSignIn(id: user.uid)
                            }
                        }
                    })
                }
            })
            
        }
        
    }
    
    func completeSignIn(id: String) {
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("**: Data saved to keychain - \(keychainResult)")
        
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
    
}
















