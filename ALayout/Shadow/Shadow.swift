//
//  UIView+GradientLayer.swift
//  aCount
//
//  Created by 孙一萌 on 2018/11/24.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

public struct Shadow {
    public var color  : UIColor  = UIColor.black
    public var offset : CGVector = CGVector(dx: 0, dy: 0)
    public var opacity: CGFloat  = 0.15
    public var spread : CGFloat  = 0
    public var blur   : CGFloat  = 12
    
    public init() { }
    
    public init(color: UIColor, opacity: CGFloat, dx: CGFloat, dy: CGFloat, blur: CGFloat, spread: CGFloat) {
        self.color = color; self.opacity = opacity; self.spread = spread; self.blur = blur
        self.offset = CGVector(dx: dx, dy: dy)
    }
    
    public init(color: UIColor, opacity: CGFloat, dx: CGFloat, dy: CGFloat, blur: CGFloat) {
        self.init(color: color, opacity: opacity, dx: dx, dy: dy, blur: blur, spread: 0)
    }
}

public typealias ShadowLayer = CALayer

extension ALView {
    
    open override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        for shadowHandler in needsLayoutShadowHandlers { shadowHandler() }
    }
    
    open func removeShadows() -> Array<ShadowLayer> {
        let removed = shadowLayers
        for shadowLayer in shadowLayers { shadowLayer.removeFromSuperlayer() }
        shadowLayers = Array<ShadowLayer>()
        return removed
    }
    
    public func add(shadow: Shadow, animated: Bool = false) -> ShadowLayer {
        let shadowLayer = ShadowLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.backgroundColor = backgroundColor?.cgColor
        shadowLayer.set(shadow: shadow, animated: animated)
        layer.insertSublayer(shadowLayer, at: 0)
        shadowLayers.append(shadowLayer)
        
        needsLayoutShadowHandlers.append {
                shadowLayer.frame = self.bounds
                let inset = -shadow.spread
                shadowLayer.shadowPath = CGPath(roundedRect: self.bounds.insetBy(dx: inset, dy: inset),
                                                cornerWidth: self.layer.cornerRadius,
                                                cornerHeight: self.layer.cornerRadius,
                                                transform: nil)
        }
        
        return shadowLayer
    }
}
