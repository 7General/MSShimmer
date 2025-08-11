//
//  NewViewController.swift
//  MSShimmer
//
//  Created by huizhou.wang on 07/23/2025.
//  Copyright (c) 2025 huizhou.wang. All rights reserved.
//

import UIKit
import MSShimmer
import SnapKit

class NewViewController: UIViewController {
    
    // MARK: - UI Components
    private let avatarView = UIView()
    private let nameView = UIView()
    private let descriptionView = UIView()
    private let infoStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupShimmer()
        
        // 模拟网络请求
        simulateNetworkRequest()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // 设置头像视图
        avatarView.backgroundColor = .systemGray6
        avatarView.layer.cornerRadius = 25
        view.addSubview(avatarView)
        
        // 设置信息容器
        infoStackView.axis = .vertical
        infoStackView.spacing = 8
        infoStackView.distribution = .fill
        view.addSubview(infoStackView)
        
        // 设置名称视图
        nameView.backgroundColor = .systemGray6
        nameView.layer.cornerRadius = 4
        infoStackView.addArrangedSubview(nameView)
        
        // 设置描述视图
        descriptionView.backgroundColor = .systemGray6
        descriptionView.layer.cornerRadius = 4
        infoStackView.addArrangedSubview(descriptionView)
        
        // 设置约束
        avatarView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(50)
        }
        
        infoStackView.snp.makeConstraints { make in
            make.top.equalTo(avatarView)
            make.leading.equalTo(avatarView.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        nameView.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        descriptionView.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
    }
    
    private func setupShimmer() {
        // 可选：自定义默认高度
        // MSShimmerAppearance.instance.defaultShimmerHeight = 20
        
        // 启用骨架屏效果（会自动居中显示，使用默认高度12）
        avatarView.isShimmerEnabled = true
        nameView.isShimmerEnabled = true
        descriptionView.isShimmerEnabled = true
        
        // 开始所有骨架屏动画
        view.startAllShimmers()
    }
    
    private func simulateNetworkRequest() {
        // 模拟3秒后网络请求完成
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.showRealContent()
        }
    }
    
    private func showRealContent() {
        // 停止所有骨架屏动画
        view.stopAllShimmers()
        
        // 显示真实内容
        avatarView.backgroundColor = .systemBlue
        nameView.backgroundColor = .systemGreen
        descriptionView.backgroundColor = .systemOrange
        
        // 添加真实内容
        let nameLabel = UILabel()
        nameLabel.text = "张三"
        nameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        nameView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let descLabel = UILabel()
        descLabel.text = "iOS开发工程师"
        descLabel.font = .systemFont(ofSize: 14)
        descLabel.textColor = .systemGray
        descriptionView.addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    @objc private func restartShimmer() {
        // 重新开始骨架屏动画
        view.startAllShimmers()
        
        // 3秒后再次停止
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.view.stopAllShimmers()
        }
    }
}

// MARK: - 演示防重复执行功能
extension NewViewController {
    
    func demonstrateAntiRepeatExecution() {
        // 连续多次调用startShimmer，只有第一次会生效
        avatarView.startShimmer()
        avatarView.startShimmer() // 这次调用会被忽略
        avatarView.startShimmer() // 这次调用会被忽略
        
        print("防重复执行演示：连续调用startShimmer，只有第一次生效")
    }
} 