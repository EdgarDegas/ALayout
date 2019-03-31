//
//  GradientLayer.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/31.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

class GradientLayer: CAGradientLayer {
    init(settings: GradientSettings) {
        super.init()
        let allStops = settings.allStops
        colors = allStops.map { $0.color.cgColor }
        startPoint = settings.beginStop.cgPoint
        endPoint   = settings.endStop  .cgPoint
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("You should not initialize ALayout.GradientLayer from IB or with `init?(coder:)`.")
    }
}
