//
//  CALayer+Shadow.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/19.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

extension CALayer: LayerHavingShadow {
    public func set(shadow: Shadow, animated: Bool, completion: (() -> Void)? = nil) {
        if animated { animate(into: shadow, completion: completion) }
        if self is ShadowLayer { (self as! ShadowLayer).shadow = shadow }
        else { configureShadow(shadow) }
    }
    
    public func removeShadow(animated: Bool, completion: (() -> Void)?) {
        set(shadow: .init(), animated: animated) {
            self.removeFromSuperlayer()
            completion?()
        }
    }
    
    func configureShadow(_ shadow: Shadow) {
        shadowOpacity = Float(shadow.opacity)
        shadowRadius  = shadow.blur
        shadowColor   = shadow.color.cgColor
        shadowOffset  = shadow.offset.cgSize
    }
    
    func animate(into shadow: Shadow, completion: (() -> Void)? = nil) {
        let duration: TimeInterval = convertTime(0.25, from: superlayer)
        let animations = CAAnimationGroup()
        animations.animations = [
            blurAnimation   (to: shadow.blur   ),
            opacityAnimation(to: shadow.opacity),
            offsetAnimation (to: shadow.offset )
        ]
        animations.duration = duration
        animations.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion?()
        }
        
        add(animations, forKey: "shadowAnimation")
    }
    
    func blurAnimation(to blur: CGFloat) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "shadowRadius")
        animation.fromValue = shadowRadius
        animation.toValue = blur
        return animation
    }
    
    func opacityAnimation(to opacity: CGFloat) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = shadowOpacity
        animation.toValue = Float(opacity)
        return animation
    }
    
    func offsetAnimation(to offset: CGVector) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "shadowOffset")
        animation.fromValue = shadowOffset
        animation.toValue = offset.cgSize
        return animation
    }
}
