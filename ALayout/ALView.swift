//
//  ShadowView.swift
//  ALayout
//
//  Created by 孙一萌 on 2018/12/21.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

open class ShadowLayer: CALayer { }

open class ALView: UIView {
    open override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if let sublayers = layer.sublayers {
            for sublayer in sublayers where sublayer is ShadowLayer {
                sublayer.frame = bounds
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
        shadowLayer.frame = bounds
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.set(shadow: shadow, animated: animated)
        shadowLayer.backgroundColor = backgroundColor?.cgColor
        layer.insertSublayer(shadowLayer, at: 0)
        return shadowLayer
    }
}
