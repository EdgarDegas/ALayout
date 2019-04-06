//
//  GradientLayer.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/31.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

class GradientLayer: CAGradientLayer {
    
    open func setGradient(with colors: Array<ColorDescribable>, within direction: GradientLinearDirection = .vertical) {
        var settings = GradientSettings(colorStops: colors.map { return GradientStop(color: $0) })
        settings.direction = direction
        setGradient(with: settings)
    }
    
    open func setGradient(from beginColor: ColorDescribable, to endColor: ColorDescribable, within direction: GradientLinearDirection = .vertical) {
        setGradient(with: [beginColor, endColor], within: direction)
    }
    
    open func setGradient(with settings: GradientSettings) {
        colors = settings.colorStops.map { $0.color.cgColor }
        startPoint = CGPoint(x: settings.beginPoint.x, y: settings.beginPoint.y)
        endPoint   = CGPoint(x: settings.endPoint  .x, y: settings.endPoint  .y)
    }
}
