//
//  MSShimmerContainerView.swift
//  MSAnimated
//
//  Created by zz on 23.7.25.
//

import UIKit

open class MSShimmerContainerView: MSView {
    private let gradientView = MSShimmerView()
    
    open override func setupUI() {
        addSubview(gradientView)
    }
    
    open override func setupLayout() {
        guard let superview = gradientView.superview else { return }
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: superview.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            gradientView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
    }
    
    open override func setupStyle() {
        self.layer.cornerRadius = MSShimmerAppearance.instance.shimmerCornerRadius
        self.layer.masksToBounds = true
    }
}

extension MSShimmerContainerView {
    public var gradientLayer:MSShimmerGradientLayer {
        return gradientView.gradientLayer
    }
    
    @objc open func stop() {
        self.removeFromSuperview()
        gradientLayer.stopSliding()
    }
    
    @objc open func start() {
        prepareColors()
        gradientLayer.slide()
    }
    
    func prepareColors() {
        gradientLayer.colors = MSShimmerAppearance.instance.shimmerColors
    }
}
