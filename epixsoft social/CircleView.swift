//
//  CircleView.swift
//  epixsoft social
//
//  Created by Kasper Hansen on 10/02/2017.
//  Copyright © 2017 EpixSoft. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = SHADOW_GRAY_COLOR
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = self.frame.width / 2
    }

}
