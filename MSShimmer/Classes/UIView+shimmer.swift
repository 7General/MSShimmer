//
//  UIView+MSShimmer.swift
//  MSShimmer
//
//  Created by zz on 23.7.25.
//

import UIKit

private var shimmerContainerKey: UInt8 = 0
private var isShimmerEnabledKey: UInt8 = 1
private var isShimmerActiveKey: UInt8 = 2

public extension UIView {
    
    @objc var isShimmer: Bool {
        get {
            return objc_getAssociatedObject(self, &isShimmerEnabledKey) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &isShimmerEnabledKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if newValue {
                shimmerIfNeeded()
            }
        }
    }
    
    
    /// 设置骨架屏（如果需要）
    private func shimmerIfNeeded() {
        let container = MSShimmerContainerView()
        container.translatesAutoresizingMaskIntoConstraints = false
        addSubview(container)

        if let imageView = self as? UIImageView {
            NSLayoutConstraint.activate([
                container.topAnchor.constraint(equalTo: topAnchor),
                container.bottomAnchor.constraint(equalTo: bottomAnchor),
                container.leadingAnchor.constraint(equalTo: leadingAnchor),
                container.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
            container.layer.cornerRadius = imageView.layer.cornerRadius
            container.layer.masksToBounds = imageView.layer.masksToBounds
        } else {
            NSLayoutConstraint.activate([
                container.centerYAnchor.constraint(equalTo: centerYAnchor),
                container.leadingAnchor.constraint(equalTo: leadingAnchor),
                container.trailingAnchor.constraint(equalTo: trailingAnchor),
                container.heightAnchor.constraint(equalToConstant: MSShimmerAppearance.instance.defaultShimmerHeight)
            ])
        }
    }
}

// MARK: - 批量管理扩展
public extension UIView {
    func ms_start(force:Bool = false) {
        self.startShimmer(force: force)
    }
    
    func ms_stop() {
        self.stopShimmer()
    }
}
