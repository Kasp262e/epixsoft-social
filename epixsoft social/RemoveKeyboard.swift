//
//  RemoveKeyboard.swift
//  epixsoft social
//
//  Created by Kasper Hansen on 12/02/2017.
//  Copyright © 2017 EpixSoft. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
