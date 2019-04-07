//
//  GradientStop.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/31.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

struct GradientStop {
    var color: ColorDescribable
    var progress: Double?
    
    init(color: ColorDescribable, progress: Double? = nil) {
        self.color    = color
        self.progress = progress
    }
}

extension Double {
    var nsNumber: NSNumber {
        return NSNumber(value: self)
    }
}
