//
//  UIView+Shadow.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/17.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

extension UIView: HavingShadow {

    open func set(shadow: Shadow, animated: Bool = false) {
        if let sublayers = layer.sublayers {
            sublayers.forEach { if $0 is ShadowLayer { $0.removeFromSuperlayer() } }
        }
        configureShadow(shadow, animated: animated)
    }
    
    open func layoutShadows() {
        guard let sublayers = layer.sublayers else { return }
        for shadowLayer in sublayers where shadowLayer is ShadowLayer {
            configureLayout(of: shadowLayer as! ShadowLayer)
        }
    }
}


extension UIView {
    
    private func configureShadow(_ shadow: Shadow, animated: Bool) {
        let shadowLayer = ShadowLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.backgroundColor = backgroundColor?.cgColor
        layer.insertSublayer(shadowLayer, at: 0)
        shadowLayer.set(shadow: shadow, animated: animated)
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
