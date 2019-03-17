//
//  UIView+Shadow.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/17.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

extension UIView: HavingShadow {
    
    var shadowLayer: ShadowLayer? {
        return layer.sublayers?.first(where: { $0 is ShadowLayer }) as? ShadowLayer
    }
    
    open func removeShadow(animated: Bool = false, completion: (() -> Void)? = nil) {
        shadowLayer?.removeShadow(animated: animated, completion: completion)
    }

    open func set(shadow: Shadow, animated: Bool = false, completion: (() -> Void)? = nil) {
        if let shadowLayer = shadowLayer {
            shadowLayer.set(shadow: shadow, animated: animated, completion: completion)
        } else {
            configureShadow(shadow, animated: animated, completion: completion)
        }
    }
    
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
        shadowLayer.set(shadow: shadow, animated: animated, completion: completion)
        configureLayout(of: shadowLayer)
    }
    
    private func configureLayout(of shadowLayer: ShadowLayer) {
        guard let shadow = shadowLayer.shadow else { return }
        shadowLayer.frame = bounds
        let inset = -shadow.spread
        shadowLayer.shadowPath = CGPath(
            roundedRect: bounds.insetBy(dx: inset, dy: inset),
            cornerWidth : layer.cornerRadius,
            cornerHeight: layer.cornerRadius,
            transform: nil)
    }
}
