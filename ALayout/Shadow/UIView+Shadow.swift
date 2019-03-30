//
//  UIView+Shadow.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/17.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

extension UIView: HavingShadow {
    
    /// View's shadow layer.
    ///
    /// You can get its current shadow parameters by visiting shadowLayer's `shadow` property,
    /// which is normally not nil, unless you are instantiating the ShadowLayer by yourself.
    public var shadowLayer: ShadowLayer? {
        return layer.sublayers?.first(where: { $0 is ShadowLayer }) as? ShadowLayer
    }
    
    
    /// Add or change the shadow of the view.
    ///
    /// If you have not call this method before, this method creates a ShadowLayer object, which
    /// is a CALayer subclass, and insert it at the bottom of the layer hierarchy of the view.
    ///
    /// If you've already set the shadow of the view, this method would update the shadow parameters
    /// of the exsisting shadow layer instead of inserting a new one.
    ///
    /// You can visit view's `shadowLayer` property for current shadow parameters. This property is
    /// nil if shadow has not been set.
    ///
    /// - Note:
    ///     Shadow is a struct-based type, so you don't have to worry about any memory issue.
    ///
    ///     If you don't want the inserting of a new CALayer, you can call `set(shadow:)` directly
    ///     on your view's layer to add shadow on it.
    ///
    /// - Parameters:
    ///     - shadow: Shadow with parameters from you app's design.
    ///     - animated: If true, the shadow changes with animation.
    ///     - completion: Invoked when animation ends (or immediately after the shadow is set
    ///       if not animated).
    open func set(shadow: Shadow, animated: Bool = false, completion: (() -> Void)? = nil) {
        if let shadowLayer = shadowLayer {
            shadowLayer.set(shadow: shadow, animated: animated, completion: completion)
        } else {
            configureShadow(shadow, animated: animated, completion: completion)
        }
    }
    
    
    /// Remove the shadow layer from your view's layer hierarchy.
    ///
    /// - Parameters:
    ///     - animated: If true, the shadow disappear with a fade transition.
    ///     - completion: Block invoked after transition.
    /// - Important:
    ///     This competion is called only if there is actually a shadow layer before being removed.
    open func removeShadow(animated: Bool = false, completion: (() -> Void)? = nil) {
        guard let shadowLayer = shadowLayer else { return }
        shadowLayer.removeShadow(animated: animated, completion: completion)
        shadowLayer.removeFromSuperlayer()
    }

    
    /// This method reset the shadow layer's position and size.
    ///
    /// You should call this method in UIView or UIViewController's life cycle methods like
    /// `viewDidLayoutSubviews` or `layoutSublayers(of:)`.
    ///
    /// Otherwise, the shadow layer's position or size would be wrong when the view
    /// hierarchy is updated.
    ///
    /// This method will be deprecated once the layer behaviour is optimized.
    open func layoutShadow() {
        guard let sublayers = layer.sublayers else { return }
        for shadowLayer in sublayers where shadowLayer is ShadowLayer {
            configureLayout(of: shadowLayer as! ShadowLayer)
        }
    }
}


extension UIView {
    
    private func configureShadow(_ shadow: Shadow, animated: Bool, completion: (() -> Void)? = nil) {
        let shadowLayer = ShadowLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.backgroundColor = backgroundColor?.cgColor
        layer.insertSublayer(shadowLayer, at: 0)
        shadowLayer.frame = layer.bounds
        shadowLayer.set(shadow: shadow, animated: animated, completion: completion)
        configureLayout(of: shadowLayer)
    }
    
    private func configureLayout(of shadowLayer: ShadowLayer) {
        guard let shadow = shadowLayer.shadow else { return }
        shadowLayer.frame = bounds
        shadowLayer.configureShadow(shadow)
    }
}
