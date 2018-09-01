//
//  UIView+Animation.swift
//  ZKPasswordGuide
//
//  Created by Zeeshan Khan on 8/31/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit

extension UIView {
    func rotate(angle: Double) {
        let degree = CGFloat(angle * .pi/180)
        transform = CGAffineTransform(rotationAngle: degree)
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
