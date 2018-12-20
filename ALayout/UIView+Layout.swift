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
    
    init(color: UIColor, opacity: CGFloat, dx: CGFloat, dy: CGFloat, blur: CGFloat, spread: CGFloat) {
        self.color = color; self.opacity = opacity; self.spread = spread; self.blur = blur
        self.offset = CGVector(dx: dx, dy: dy)
    }
}

public extension UIView {
    func addGradientLayer(gradientLayer: CAGradientLayer) {
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func add(shadow: Shadow) -> CALayer {
        let shadowLayer = CALayer()
        shadowLayer.frame = bounds
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.add(shadow: shadow)
        shadowLayer.backgroundColor = backgroundColor?.cgColor
        layer.insertSublayer(shadowLayer, at: 0)
        return shadowLayer
    }
}

public extension CALayer {
    func add(shadow: Shadow) {
        shadowColor   = shadow.color.cgColor
        shadowRadius  = shadow.blur
        shadowOffset  = CGSize(width: shadow.offset.dx, height: shadow.offset.dy)
        shadowOpacity = Float(shadow.opacity)
        shadowPath = CGPath(roundedRect: bounds.insetBy(dx: -shadow.spread, dy: -shadow.spread), cornerWidth: cornerRadius, cornerHeight: cornerRadius, transform: nil)
    }
}
