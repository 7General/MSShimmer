//
//  MSShimmerGradientLayer+shimeer.swift
//  MSAnimated
//
//  Created by zz on 23.7.25.
//

import Foundation
import QuartzCore

extension CABasicAnimation {
    func apply(gradientTransition: MSShimmerTransition) {
        fromValue = NSValue(cgPoint: gradientTransition.from.cgPoint)
        toValue = NSValue(cgPoint: gradientTransition.to.cgPoint)
    }
}

public class MSShimmerGradientLayer:CAGradientLayer {
    private static let kSlidingAnimationKey = "com.opay.shimeer.animation"
    
    func slide() {
        slide(to: .right)
    }
    
    func slide(to dir: MSShimmerDirection, group: ((CAAnimationGroup) -> Void) = { _ in }) {
        let startPoint = dir.transition(for: .startPoint)
        let endPoint = dir.transition(for: .endPoint)
        
        let startPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnim.apply(gradientTransition: startPoint)
        
        let endPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnim.apply(gradientTransition: endPoint)
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [startPointAnim, endPointAnim]
        animGroup.duration = MSShimmerAppearance.instance.duration
        animGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animGroup.repeatCount = .infinity
        
        group(animGroup)
        add(animGroup, forKey: MSShimmerGradientLayer.kSlidingAnimationKey)
    }
    
    
    func stopSliding() {
        removeAnimation(forKey: MSShimmerGradientLayer.kSlidingAnimationKey)
    }
}
