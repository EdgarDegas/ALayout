//
//  CALayer+Shadow.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/19.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

extension CALayer: LayerHavingShadow {
    
    /// Add or change the shadow parameters of the layer.
    ///
    /// - Parameters:
    ///     - shadow: A Shadow object containing shadow parameters.
    ///     - animated: If true, the changing of shadow is animated.
    ///     - completion: The handler is invoked when the animation completes
    ///       (or immediately after the setup of the shadow if not animated).
    public func set(shadow: Shadow, animated: Bool, completion: (() -> Void)? = nil) {
        if animated { animate(into: shadow, completion: completion) }
        if self is ShadowLayer { (self as! ShadowLayer).shadow = shadow }
        else { configureShadow(shadow) }
        if animated == false { completion?() }
    }
    
    /// Visually remove the shadow of the layer.
    ///
    /// This method set the shadow parameters into the default sets of `Shadow`.
    ///
    /// - Parameters:
    ///     - animated: If true, the removing process is animated.
    ///     - completion: Invoked after animtion (or immediately after the
    ///       shadow is set if not animated).
    public func removeShadow(animated: Bool, completion: (() -> Void)?) {
        set(shadow: .init(), animated: animated) {
            completion?()
        }
    }
    
    func configureShadow(_ shadow: Shadow) {
        configureShadowPath(using: shadow.spread)
        shadowOpacity = Float(shadow.opacity)
        shadowRadius  = shadow.blur
        shadowColor   = shadow.color.cgColor
        shadowOffset  = CGSize.size(from: shadow.offset)
    }
    
    func configureShadowPath(using spread: CGFloat) {
        shadowPath = CGPath.shadowPath(for: self, with: spread)
    }
    
    func animate(into shadow: Shadow, completion: (() -> Void)? = nil) {
        let duration: TimeInterval = convertTime(0.25, from: superlayer)
        let animations = CAAnimationGroup()
        let newPath = CGPath.shadowPath(for: self, with: shadow.spread)
        
        animations.animations = [
            blurAnimation   (to: shadow.blur   ),
            opacityAnimation(to: shadow.opacity),
            offsetAnimation (to: CGSize.size(from: shadow.offset)),
            pathAnimation(to: newPath)
        ]
        
        animations.duration = duration
        animations.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion?()
        }
        
        add(animations, forKey: "shadowAnimation")
    }
    
    func pathAnimation(to path: CGPath) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "shadowPath")
        animation.fromValue = shadowPath
        animation.toValue = path
        return animation
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
    
    func offsetAnimation(to offset: CGSize) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "shadowOffset")
        animation.fromValue = shadowOffset
        animation.toValue = offset
        return animation
    }
}
