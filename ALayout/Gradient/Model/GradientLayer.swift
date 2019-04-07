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

// MARK: - Helpers
extension GradientLayer {
    private func animate(into gradientSettings: GradientSettings, completion: (() -> Void)? = nil) {
        let duration: TimeInterval = convertTime(0.25, from: superlayer)
        let animationGroup = CAAnimationGroup()
        
        
        let pointAnimations = directionAnimations(to: gradientSettings)
        
        animationGroup.animations = [
            colorsAnimation(to: gradientSettings),
            pointAnimations.startPoint,
            pointAnimations.endPoint,
            locationsAnimation(to: gradientSettings)
        ]
        
        animationGroup.duration = duration
//        animationGroup.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion?()
        }
        
        add(animationGroup, forKey: "gradientAnimation")
    }
    
    private func colorsAnimation(to gradientSettings: GradientSettings) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: #keyPath(colors))
        animation.fromValue = colors
        animation.toValue = gradientSettings.colorStops.map { $0.color.cgColor }
        return animation
    }
    
    private func directionAnimations(to gradientSettings: GradientSettings) -> (startPoint: CABasicAnimation, endPoint: CABasicAnimation) {
        func pointAnimation(keyPath: String?, from: CGPoint, to: CGPoint) -> CABasicAnimation {
            let animation = CABasicAnimation(keyPath: keyPath)
            animation.fromValue = from
            animation.toValue   = to
            return animation
        }
        
        let beginPoint = gradientSettings.beginPoint!
        let beginAnimation = pointAnimation(keyPath: #keyPath(startPoint), from: startPoint, to: .init(x: beginPoint.x, y: beginPoint.y))
        
        let theEndPoint = gradientSettings.endPoint!
        let endAnimation = pointAnimation(keyPath: #keyPath(endPoint), from: endPoint, to: .init(x: theEndPoint.x, y: theEndPoint.y))
        return (beginAnimation, endAnimation)
    }
    
    private func locationsAnimation(to gradientSettings: GradientSettings) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: #keyPath(locations))
        animation.fromValue = locations
        animation.toValue = gradientSettings.colorStops.compactMap { $0.progress?.nsNumber }
        return animation
    }
}
