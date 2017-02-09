//
//  FeedVC.swift
//  epixsoft social
//
//  Created by Kasper Hansen on 09/02/2017.
//  Copyright © 2017 EpixSoft. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToSignIn", sender: nil)
        let keyChainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("**: ID removed from keychain - \(keyChainResult)")
        try! FIRAuth.auth()?.signOut()

    }
    
}
