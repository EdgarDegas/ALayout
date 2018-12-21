//
//  ShadowView.swift
//  ALayout
//
//  Created by 孙一萌 on 2018/12/21.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

open class ALView: UIView {
    open override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if let sublayers = layer.sublayers {
            for sublayer in sublayers where sublayer is ShadowLayer {
                (sublayer as! ShadowLayer).layout()
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
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.backgroundColor = backgroundColor?.cgColor
        shadowLayer.set(shadow: shadow, animated: animated)
        layer.insertSublayer(shadowLayer, at: 0)
        return shadowLayer
    }
}
