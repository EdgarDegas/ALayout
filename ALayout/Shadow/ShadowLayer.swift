//
//  ShadowLayer.swift
//  ALayout
//
//  Created by 孙一萌 on 2018/12/21.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

extension ShadowLayer {
    public func set(shadow: Shadow, animated: Bool) {
        shadowOpacity = Float(shadow.opacity)
        shadowRadius  = shadow.blur
        shadowColor   = shadow.color.cgColor
        shadowOffset  = CGSize(width: shadow.offset.dx, height: shadow.offset.dy)
        shadowPath    = CGPath(roundedRect: bounds.insetBy(dx: -shadow.spread, dy: -shadow.spread),
                               cornerWidth: cornerRadius,
                               cornerHeight: cornerRadius,
                               transform: nil)
        
        guard animated else { return }
        
        let animations = CAAnimationGroup()
        let radiusAnimation: CABasicAnimation = {
            let theAnimation = CABasicAnimation(keyPath: "shadowRadius")
            theAnimation.fromValue = 0.0
            theAnimation.toValue = shadowRadius
            return theAnimation
        }()
        
        let opacityAnimation: CABasicAnimation = {
            let theAnimation = CABasicAnimation(keyPath: "shadowOpacity")
            theAnimation.fromValue = 0.0
            theAnimation.toValue = shadowOpacity
            return theAnimation
        }()
        
        animations.animations = [radiusAnimation, opacityAnimation]
        animations.duration = 0.24
        animations.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        add(animations, forKey: "shadowAnimation")
    }
    
}
