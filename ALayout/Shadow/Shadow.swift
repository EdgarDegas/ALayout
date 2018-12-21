//
//  UIView+GradientLayer.swift
//  aCount
//
//  Created by 孙一萌 on 2018/11/24.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

public struct Shadow {
    var color  : UIColor  = UIColor.black
    var offset : CGVector = CGVector(dx: 0, dy: 0)
    var opacity: CGFloat  = 0.15
    var spread : CGFloat  = 0
    var blur   : CGFloat  = 12
    
    public init(color: UIColor, opacity: CGFloat, dx: CGFloat, dy: CGFloat, blur: CGFloat, spread: CGFloat) {
        self.color = color; self.opacity = opacity; self.spread = spread; self.blur = blur
        self.offset = CGVector(dx: dx, dy: dy)
    }
}

public extension UIView {
    public func addGradientLayer(gradientLayer: CAGradientLayer) {
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
