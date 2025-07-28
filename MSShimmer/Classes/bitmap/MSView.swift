//
//  MSAnimatedView2.swift
//  MSAnimated
//
//  Created by zz on 14.7.25.
//

import UIKit

open class MSView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        self.setupLayout()
        self.setupStyle()
        self.setupAction()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupUI()
        self.setupLayout()
        self.setupStyle()
        self.setupAction()
    }

    open func setupUI() {

    }

    open func setupLayout() {

    }

    open func setupStyle() {

    }

    open func setupAction() {

    }
    
    deinit {
        
    }

}



public extension UIView {
    func startShimmer() {
        subviews.forEach { subview in
            if let shimmer = subview as? MSShimmerContainerView {
                shimmer.start()
            } else {
                subview.startShimmer()
            }
        }
    }
    
    func stopShimmer() {
        subviews.forEach { subview in
            if let shimmer = subview as? MSShimmerContainerView {
                shimmer.stop()
            } else {
                subview.stopShimmer()
            }
        }
    }
}
