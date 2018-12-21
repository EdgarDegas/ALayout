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

extension ALView {
    open override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if let sublayers = layer.sublayers {
            for sublayer in sublayers where sublayer is ShadowLayer {
                (sublayer as! ShadowLayer).layout()
            }
        }
    }
    
    open func removeShadows() -> Array<ShadowLayer> {
        var removed = Array<ShadowLayer>()
        if let sublayers = layer.sublayers {
            for sublayer in sublayers where sublayer is ShadowLayer {
                removed.append(sublayer as! ShadowLayer)
                sublayer.removeFromSuperlayer()
            }
        }
        return removed
    }
    
    public func add(shadow: Shadow, animated: Bool = false) -> ShadowLayer {
        let shadowLayer = ShadowLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.backgroundColor = backgroundColor?.cgColor
        shadowLayer.set(shadow: shadow, animated: animated)
        layer.insertSublayer(shadowLayer, at: 0)
        return shadowLayer
    }
}
