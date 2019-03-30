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
        var shadowCopy = shadow
        shadowCopy.path = CGPath.shadowPath(for: self, with: shadow.spread)
        if animated { animate(into: shadowCopy, completion: completion) }
        if self is ShadowLayer { (self as! ShadowLayer).shadow = shadowCopy }
        else { configureShadow(shadowCopy) }
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
        shadowPath = shadow.path
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
            offsetAnimation (to: shadow.offset ),
        ]
        
        if let pathAnimation = pathAnimation(to: shadow.path) {
            animations.animations?.append(pathAnimation)
        }
        
        animations.duration = duration
        animations.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion?()
        }
        
        add(animations, forKey: "shadowAnimation")
    }
    
    func pathAnimation(to path: CGPath?) -> CABasicAnimation? {
        guard let path = path else { return nil }
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
    
    func offsetAnimation(to offset: CGVector) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "shadowOffset")
        animation.fromValue = shadowOffset
        animation.toValue = offset.cgSize
        return animation
    }
}
