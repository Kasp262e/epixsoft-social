//
//  CircleView.swift
//  epixsoft social
//
//  Created by Kasper Hansen on 10/02/2017.
//  Copyright © 2017 EpixSoft. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
    }
}
