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
    
    var gradientLayers:Array<GradientLayer>? {
        return layer.sublayers?.filter { $0 is GradientLayer } as? Array<GradientLayer>
    }
    
    open func setGradientBackground(with colors: Array<ColorDescribable>, within direction: GradientLinearDirection = .vertical) {
        if let backgroundLayer = gradientBackgroundLayer {
            backgroundLayer.setGradient(with: colors, within: direction)
        } else {
            addGradientLayer(with: colors, within: direction, isBackground: true)
        }
    }
    
    open func setGradientBackground(from beginColor: ColorDescribable, to endColor: ColorDescribable, within direction: GradientLinearDirection = .vertical) {
        if let backgroundLayer = gradientBackgroundLayer {
            backgroundLayer.setGradient(from: beginColor, to: endColor, within: direction)
        } else {
            addGradientLayer(from: beginColor, to: endColor, within: direction, isBackground: true)
        }
    }
    
    open func setGradientBackground(with settings: GradientSettings) {
        if let backgroundLayer = gradientBackgroundLayer {
            backgroundLayer.setGradient(with: settings)
        } else {
            addGradientLayer(with: settings, isBackground: true)
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
    
    private func addGradientLayer(with settings: GradientSettings, isBackground: Bool) {
        let gradientLayer = insertGradientLayer(isBackground: isBackground)
        gradientLayer.setGradient(with: settings)
    }
    
    private func addGradientLayer(with colors: Array<ColorDescribable>, within direction: GradientLinearDirection, isBackground: Bool) {
        let gradientLayer = insertGradientLayer(isBackground: isBackground)
        gradientLayer.setGradient(with: colors, within: direction)
    }
    
    private func addGradientLayer(from beginColor: ColorDescribable, to endColor: ColorDescribable, within direction: GradientLinearDirection, isBackground: Bool) {
        addGradientLayer(with: [beginColor, endColor], within: direction, isBackground: isBackground)
    }
    
    
    private func insertGradientLayer(isBackground: Bool) -> GradientLayer {
        var gradientLayer: GradientLayer
        if isBackground {
            gradientLayer = GradientBackgroundLayer()
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer = GradientLayer()
            layer.addSublayer(gradientLayer)
        }
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        return gradientLayer
    }
    
    private func configureLayout(of gradientLayer: GradientLayer) {
        gradientLayer.frame = bounds
    }
}
