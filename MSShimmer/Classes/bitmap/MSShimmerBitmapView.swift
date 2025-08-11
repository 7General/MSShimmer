//
//  MSShimmerBitmapView.swift
//  MSShimmer
//
//  Created by zz on 26.7.25.
//

import UIKit


// 空白容器页面bitmap
open class MSShimmerBitmapView: MSShimmerContainerView {
    open override func setupUI() {
        
    }
    
    open override func start(force:Bool = false) {
        startShimmer()
    }
    
    open override func stop() {
        stopShimmer()
        self.removeFromSuperview()
    }
}
