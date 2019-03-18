//
//  ShadowLayer.swift
//  ALayout
//
//  Created by 孙一萌 on 2018/12/21.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

public class ShadowLayer: CALayer {
    
    var shadow: Shadow? {
        didSet {
            guard let newValue = shadow else { return }
            configureShadow(newValue)
        }
    }
    
    public override init() { super.init() }
    public override init(layer: Any) { super.init(layer: layer) }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Improper to initialize ShadowLayer from any IB.")
    }
}
