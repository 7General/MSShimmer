//
//  MSShimmerDirection.swift
//  MSAnimated
//
//  Created by zz on 23.7.25.
//

import UIKit

struct MSShimmerTransition {
    let from: MSShimmerPoint
    let to: MSShimmerPoint
}

enum MSShimmerProperty {
    case startPoint
    case endPoint
}

/// The direction to slide in.
public enum MSShimmerDirection {
    case right
    
    func transition(for point: MSShimmerProperty) -> MSShimmerTransition {
        switch (self, point) {
        case (.right, .startPoint):
            return MSShimmerTransition(
                from: MSShimmerPoint(x: .negativeOne),
                to: MSShimmerPoint(x: .one))
            
        case (.right, .endPoint):
            return MSShimmerTransition(
                from: MSShimmerPoint(x: .zero),
                to: MSShimmerPoint(x: .two))
        }
    }
}


