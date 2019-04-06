//
//  GradientLayer.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/31.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

class GradientLayer: CAGradientLayer {
    
    open func setGradient(with settings: GradientSettings, animated: Bool = false) {
        let allStops = settings.allStops
        colors = allStops.map { $0.color.cgColor }
        startPoint = settings.beginStop.cgPoint
        endPoint   = settings.endStop  .cgPoint
    }
}
