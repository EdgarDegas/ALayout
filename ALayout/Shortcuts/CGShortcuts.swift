//
//  CGShortcuts.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/19.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

extension CGVector {
    var cgSize: CGSize { return .init(width: dx, height: dy) }
}


extension CGPath {
    static func shadowPath(for layer: CALayer, with spread: CGFloat) -> CGPath {
        if let shapeSelf = layer as? CAShapeLayer,
            let path = shapeSelf.path?.copy() {
            return path.copy(
                strokingWithWidth: shapeSelf.lineWidth + spread,
                lineCap: .square, lineJoin: .bevel, miterLimit: 0)
        }
        
        return CGPath(
            roundedRect : layer.bounds.insetBy(dx: -spread, dy: -spread),
            cornerWidth : layer.cornerRadius,
            cornerHeight: layer.cornerRadius,
            transform: nil)
    }
}
