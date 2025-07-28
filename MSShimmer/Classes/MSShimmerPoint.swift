//
//  MSShimmerPoint.swift
//  MSAnimated
//
//  Created by zz on 23.7.25.
//

import UIKit

struct MSShimmerPoint {
    enum Location: CGFloat {
        case `default` = 0.5
        
        case negativeOne = -1
        case zero = 0
        case one
        case two
    }
    
    let x: Location
    let y: Location
    
    init(x: Location = .default, y: Location = .default) {
        self.x = x
        self.y = y
    }
    
    var cgPoint: CGPoint {
        return CGPoint(x: x.rawValue, y: y.rawValue)
    }
}
