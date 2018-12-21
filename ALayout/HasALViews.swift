//
//  HasALViews.swift
//  ALayout
//
//  Created by 孙一萌 on 2018/12/21.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

protocol HasALViews {
    var alViews: Array<ALView>! { get set }
    func removeShadows()
}

extension HasALViews {
    func removeShadows() -> Array<ShadowLayer> {
        var removed = Array<ShadowLayer>()
        for alView in alViews {
            removed += alView.removeShadows()
        }
        return removed
    }
}
