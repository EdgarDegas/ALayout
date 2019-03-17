//
//  UIView+GradientLayer.swift
//  aCount
//
//  Created by 孙一萌 on 2018/11/24.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

public struct Shadow {
    public var color  : UIColor  = .black
    public var offset : CGVector = .init(dx: 0, dy: 0)
    public var opacity: CGFloat  = 0
    public var spread : CGFloat  = 0
    public var blur   : CGFloat  = 0
    
    public init() { }
    
    public init(color: UIColor, opacity: CGFloat, dx: CGFloat, dy: CGFloat, blur: CGFloat, spread: CGFloat) {
        self.color   = color
        self.opacity = opacity
        self.spread  = spread
        self.blur    = blur
        self.offset  = .init(dx: dx, dy: dy)
    }
    
    public init(color: UIColor, opacity: CGFloat, dx: CGFloat, dy: CGFloat, blur: CGFloat) {
        self.init(color: color, opacity: opacity, dx: dx, dy: dy, blur: blur, spread: 0)
    }
}
