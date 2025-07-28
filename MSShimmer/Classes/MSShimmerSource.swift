//
//  MSShimmerSource.swift
//  MSAnimated
//
//  Created by zz on 23.7.25.
//

import UIKit

public protocol MSShimmerSource: AnyObject {
  var shimmerContainers: [MSShimmerContainerView] { get }
}

public extension MSShimmerSource {
    func start() {
        shimmerContainers.forEach({ $0.start() })
    }
    
    func stop() {
        shimmerContainers.forEach({ $0.stop() })
    }
}
