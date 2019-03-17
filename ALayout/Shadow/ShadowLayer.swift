//
//  ShadowLayer.swift
//  ALayout
//
//  Created by 孙一萌 on 2018/12/21.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

public class ShadowLayer: CALayer {
    
    private(set) var shadow: Shadow?
    
    public override init() { super.init() }
    public override init(layer: Any) { super.init(layer: layer) }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Improper to initialize ShadowLayer from any IB.")
    }
}


extension ShadowLayer: HavingShadow {
    public func set(shadow: Shadow, animated: Bool) {
        
        if animated { animate(into: shadow) }
        
        self.shadow = shadow
        shadowOpacity = Float(shadow.opacity)
        shadowRadius  = shadow.blur
        shadowColor   = shadow.color.cgColor
        shadowOffset  = shadow.offset.cgSize
        
        if bounds != CGRect.zero {
            shadowPath = CGPath(
                roundedRect: bounds.insetBy(dx: -shadow.spread, dy: -shadow.spread),
                cornerWidth: cornerRadius,
                cornerHeight: cornerRadius,
                transform: nil)
        }

    }
}

extension ShadowLayer {
    
    private func animate(into shadow: Shadow) {
        let animations = CAAnimationGroup()
        animations.animations = [
            blurAnimation   (to: shadow.blur   ),
            opacityAnimation(to: shadow.opacity),
            offsetAnimation (to: shadow.offset )
        ]
        animations.duration = 0.25
        animations.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        add(animations, forKey: "shadowAnimation")
    }
    
    private func blurAnimation(to blur: CGFloat) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "shadowRadius")
        animation.fromValue = shadowRadius
        animation.toValue = blur
        return animation
    }
    
    private func opacityAnimation(to opacity: CGFloat) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = shadowOpacity
        animation.toValue = Float(opacity)
        return animation
    }
    
    private func offsetAnimation(to offset: CGVector) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "shadowOffset")
        animation.fromValue = shadowOffset
        animation.toValue = offset.cgSize
        return animation
    }
}


fileprivate extension CGVector {
    var cgSize: CGSize { return .init(width: dx, height: dy) }
}
