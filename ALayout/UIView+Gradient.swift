//
//  UIView+Gradient.swift
//  ALayout
//
//  Created by 孙一萌 on 2018/12/21.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

public extension UIView {
    public func addGradientLayer(gradientLayer: CAGradientLayer) {
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
