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

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
    }
    
    
    
    

    @IBAction func signOutPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToSignIn", sender: nil)
        let keyChainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("**: ID removed from keychain - \(keyChainResult)")
        try! FIRAuth.auth()?.signOut()

    }
    
}
