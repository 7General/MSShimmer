//
//  MSShimmerView.swift
//  MSAnimated
//
//  Created by zz on 23.7.25.
//

import UIKit

class MSShimmerView: MSView {
    override class var layerClass: AnyClass {
        return MSShimmerGradientLayer.self
    }
}

extension MSShimmerView {
    var gradientLayer:MSShimmerGradientLayer {
        return layer as! MSShimmerGradientLayer
    }
}
