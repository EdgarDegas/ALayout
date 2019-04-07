//
//  GradientSettings.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/31.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

public struct GradientSettings {
    var colorStops: Array<GradientStop>
    
    var beginPoint: Point!
    var endPoint  : Point!
    
    var direction: GradientLinearDirection! {
        didSet {
            let points = direction.points
            beginPoint = points.begin
            endPoint   = points.end
        }
    }
    
    init(begin: GradientStop, end: GradientStop) {
        self = GradientSettings(colorStops: [begin, end])
    }
    
    init(colorStops: Array<GradientStop>, distributeEvenly: Bool = true) {
        guard colorStops.count > 1 else {
            self.colorStops = colorStops; return
        }
        
        guard distributeEvenly else {
            self.colorStops = colorStops; return
        }
        
        self.colorStops = .init()
        
        let eachProgress = 1.0 / Double(colorStops.count - 1)
        
        for index in 0..<colorStops.count {
            var stop = colorStops[index]
            stop.progress = Double(index) * eachProgress
            self.colorStops.append(stop)
        }
        
        self.colorStops = colorStops
    }
}
