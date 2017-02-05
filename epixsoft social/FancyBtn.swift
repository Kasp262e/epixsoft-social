//
//  FancyBtn.swift
//  epixsoft social
//
//  Created by Kasper Hansen on 05/02/2017.
//  Copyright © 2017 EpixSoft. All rights reserved.
//

import UIKit

class FancyBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = SHADOW_GRAY_COLOR
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        layer.cornerRadius = 2
    }

}
