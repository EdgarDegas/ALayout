//
//  UIView+Gradient.swift
//  ALayout
//
//  Created by 孙一萌 on 2018/12/21.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

extension UIView {
    
    var gradientBackgroundLayer: GradientBackgroundLayer? {
        return layer.sublayers?.first(where: { $0 is GradientBackgroundLayer }) as? GradientBackgroundLayer
    }
    
    open func setGradientBackground(with settings: GradientSettings, animated: Bool = false) {
        if let backgroundLayer = gradientBackgroundLayer {
            backgroundLayer.setGradient(with: settings, animated: animated)
        } else {
            addGradientLayer(with: settings, animated: animated)
        }
    }
    
    open func layoutGradient() {
        guard let sublayers = layer.sublayers else { return }
        for gradientLayer in sublayers where gradientLayer is GradientLayer {
            configureLayout(of: gradientLayer as! GradientLayer)
        }
    }
}



extension UIView {
    
    private func addGradientLayer(with settings: GradientSettings, animated: Bool) {
        let gradientLayer = GradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.setGradient(with: settings, animated: animated)
    }
    
    private func configureLayout(of gradientLayer: GradientLayer) {
        gradientLayer.frame = bounds
    }
}
