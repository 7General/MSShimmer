//
//  UITableView+Skeleton.swift
//  MSShimmer
//
//  Created by AI on 2024/5/10.
//

import UIKit
import ObjectiveC

// MARK: - 协议定义
public protocol MSShimmerTableViewDelegate: AnyObject {
    func numberOfSkeletonRows(in tableView: UITableView) -> Int
    func skeletonCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    
    func numberOfRealRows(in tableView: UITableView) -> Int
    func realCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
}

// MARK: - Key 定义
private var shimmerDelegateKey: UInt8 = 0
private var isShimmerActiveKey: UInt8 = 0
private var originalDataSourceKey: UInt8 = 0
private var dataSourceSwitcherKey: UInt8 = 0

// MARK: - UITableView 扩展
extension UITableView: UITableViewDataSource {
    
    private var dataSourceSwitcher: MSDataSourceSwitcher {
        if let switcher = objc_getAssociatedObject(self, &dataSourceSwitcherKey) as? MSDataSourceSwitcher {
            return switcher
        }
        let switcher = MSDataSourceSwitcher(tableView: self)
        objc_setAssociatedObject(self, &dataSourceSwitcherKey, switcher, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return switcher
    }
    
    public var shimmerDelegate: MSShimmerTableViewDelegate? {
        get { objc_getAssociatedObject(self, &shimmerDelegateKey) as? MSShimmerTableViewDelegate }
        set {
            objc_setAssociatedObject(self, &shimmerDelegateKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
            
            if newValue != nil {
                dataSourceSwitcher.activateProxy(self)
            } else {
                dataSourceSwitcher.restoreOriginal()
            }
        }
    }
    
    public var isShimmerActive: Bool {
        get { (objc_getAssociatedObject(self, &isShimmerActiveKey) as? Bool) ?? false }
        set { objc_setAssociatedObject(self, &isShimmerActiveKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private var originalDataSource: UITableViewDataSource? {
        get { objc_getAssociatedObject(self, &originalDataSourceKey) as? UITableViewDataSource }
        set { objc_setAssociatedObject(self, &originalDataSourceKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let delegate = shimmerDelegate {
            return isShimmerActive ? delegate.numberOfSkeletonRows(in: self) : delegate.numberOfRealRows(in: self)
        } else {
            return originalDataSource?.tableView(tableView, numberOfRowsInSection: section) ?? 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let delegate = shimmerDelegate {
            return isShimmerActive ? delegate.skeletonCell(for: self, at: indexPath)
            : delegate.realCell(for: self, at: indexPath)
        } else {
            return originalDataSource?.tableView(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
        }
    }
}



class MSDataSourceSwitcher {
    private weak var tableView: UITableView?
    private weak var originalDataSource: UITableViewDataSource?
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func activateProxy(_ proxy: UITableViewDataSource) {
        guard let tableView = tableView else { return }
        
        if originalDataSource == nil && tableView.dataSource !== proxy {
            originalDataSource = tableView.dataSource
        }
        tableView.dataSource = proxy
    }
    
    func restoreOriginal() {
        guard let tableView = tableView else { return }
        
        if let original = originalDataSource {
            tableView.dataSource = original
            originalDataSource = nil
        }
    }
}

