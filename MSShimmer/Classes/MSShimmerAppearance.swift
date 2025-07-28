//
//  MSAnimatedAppearance.swift
//  MSAnimated
//
//  Created by zz on 14.7.25.
//

import UIKit

public class MSShimmerAppearance: NSObject {

    private override init() {}
    
    public static let instance = MSShimmerAppearance()
    
    /**
     * 全局圆角的值
     */
    public var shimmerCornerRadius:CGFloat = 6

    /**
     * 骨架动画颜色
     */
    public var shimmerColors:[CGColor] = [
        UIColor(red: 0, green: 0, blue: 0, alpha: 0.102).cgColor,
        UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor,
        UIColor(red: 0, green: 0, blue: 0, alpha: 0.102).cgColor
    ]
    
    /**
     * 骨架动画执行时间
     */
    public var duration: CFTimeInterval = 1.5
}
