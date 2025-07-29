//
//  ViewController.swift
//  MSShimmer
//
//  Created by huizhou.wang on 07/23/2025.
//  Copyright (c) 2025 huizhou.wang. All rights reserved.
//

import UIKit
import MSShimmer
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("==================ViewController")
        // 添加注释
//        MSShimmerAppearance.instance.shimmerCornerRadius = 6
//        MSShimmerAppearance.instance.duration = 1.5
//        
//        MSShimmerAppearance.instance.shimmerColors = [
//            UIColor(red: 0, green: 0, blue: 0, alpha: 0.102).cgColor,
//            UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor,
//            UIColor(red: 0, green: 0, blue: 0, alpha: 0.102).cgColor
//        ]
        
//        view.addSubview(shimmer)
//        shimmer.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(100)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(200)
//            make.height.equalTo(12)
//        }
//        
//        view.addSubview(shimmer2)
//        shimmer2.snp.makeConstraints { make in
//            make.top.equalTo(shimmer.snp.bottom).offset(10)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(200)
//            make.height.equalTo(12)
//        }
//        
//        view.addSubview(shimmer3)
//        shimmer3.snp.makeConstraints { make in
//            make.top.equalTo(shimmer2.snp.bottom).offset(10)
//            make.left.equalTo(shimmer2)
//            make.width.equalTo(100)
//            make.height.equalTo(12)
//        }
//        
//        
//        view.addSubview(contextView)
//        contextView.snp.makeConstraints { make in
//            make.top.equalTo(shimmer3.snp.bottom).offset(20)
//            make.leading.trailing.equalToSuperview().inset(40)
//            make.height.equalTo(50)
//        }
//        
//        contextView.addSubview(shimmer4)
//        shimmer4.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(20)
//            make.leading.trailing.equalToSuperview().inset(40)
//            make.height.equalTo(12)
//        }
//        
//        //=================================
//        view.addSubview(shimmerBoard)
//        shimmerBoard.snp.makeConstraints { make in
//            make.top.equalTo(contextView.snp.bottom).offset(20)
//            make.leading.trailing.equalToSuperview().inset(40)
//            make.height.equalTo(100)
//        }
//        
//        shimmerBoard.addSubview(shimmerB1)
//        shimmerB1.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(20)
//            make.leading.trailing.equalToSuperview().inset(40)
//            make.height.equalTo(12)
//        }
//        
//        shimmerBoard.addSubview(shimmerB2)
//        shimmerB2.snp.makeConstraints { make in
//            make.top.equalTo(shimmerB1.snp.bottom).offset(20)
//            make.leading.trailing.equalToSuperview().inset(40)
//            make.height.equalTo(12)
//        }
        
        //===========================================================
        //===========================================================
        view.addSubview(subContainerView)
        subContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.00) {
            print("============start")
            self.start()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            print("============stop")
//            self.stop()
        }
        
    }
    
    
    
//    lazy var shimmer: MSShimmerContainerView = {
//        let it = MSShimmerContainerView()
//        return it
//    }()
//    
//    lazy var shimmer2: MSShimmerContainerView = {
//        let it = MSShimmerContainerView()
//        return it
//    }()
//    
//    lazy var shimmer3: MSShimmerContainerView = {
//        let it = MSShimmerContainerView()
//        return it
//    }()
//    
//    lazy var contextView: MSShimmerContextView = {
//        let it = MSShimmerContextView()
//        it.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
//        return it
//    }()
//    
//    lazy var shimmer4: MSShimmerContainerView = {
//        let it = MSShimmerContainerView()
//        return it
//    }()
//    
//    
//    lazy var shimmerBoard: MSShimmerBoardContainerView = {
//        let it = MSShimmerBoardContainerView()
//        it.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
//        return it
//    }()
//    
//    lazy var shimmerB1: MSShimmerContainerView = {
//        let it = MSShimmerContainerView()
//        return it
//    }()
//    
//    lazy var shimmerB2: MSShimmerContainerView = {
//        let it = MSShimmerContainerView()
//        return it
//    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("===================")
    }
    
    lazy var subContainerView: OPBSubContainerView = {
        let it = OPBSubContainerView()
        it.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        return it
    }()
}

extension ViewController:MSShimmerSource {
    var shimmerContainers: [MSShimmerContainerView] {
        return [
//            shimmer,
//            shimmer2,
//            shimmer3,
//            contextView,
//            shimmer4,
//            shimmerBoard,
            subContainerView
        ]
    }
}

class OPBSubContainerView:MSShimmerBitmapView {
    
    override func setupUI() {
        super.setupUI()
        addSubview(stack)
        stack.addArrangedSubview(item1)
        stack.addArrangedSubview(item2)
        stack.addArrangedSubview(item3)
    }

    
    override func setupLayout() {
        super.setupLayout()
    
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
    }
    
    lazy var stack: UIStackView = {
        let it = UIStackView()
        it.axis = .vertical
        it.spacing = 10
        it.distribution = .fill
        it.backgroundColor = .blue
        return it
    }()
    
    
    lazy var item1: OPBContainerItemView = {
        let it = OPBContainerItemView()
        it.backgroundColor = .yellow
        return it
    }()
    
    lazy var item2: OPBContainerItemView = {
        let it = OPBContainerItemView()
        it.backgroundColor = .yellow
        return it
    }()
    
    lazy var item3: OPBContainerItemView = {
        let it = OPBContainerItemView()
        it.backgroundColor = .yellow
        return it
    }()
    
}

class OPBContainerItemView:MSView {
    override func setupUI() {
        addSubview(stack)
        stack.addArrangedSubview(icon_sh)
        
        stack.addArrangedSubview(rightStack)
        rightStack.addArrangedSubview(top_sh)
        rightStack.addArrangedSubview(bottom_sh)
    }
    
    override func setupLayout() {
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    
        icon_sh.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }
    
    lazy var stack: UIStackView = {
        let it = UIStackView()
        it.axis = .horizontal
        it.alignment = .center
        it.spacing = 12
        it.distribution = .fill
        return it
    }()
    
    lazy var icon_sh: MSShimmerContainerView = {
        let it = MSShimmerContainerView()
        it.backgroundColor = .red
        it.layer.cornerRadius = 20
        it.layer.masksToBounds = true
        return it
    }()
    
    lazy var rightStack: UIStackView = {
        let it = UIStackView()
        it.axis = .vertical
        it.spacing = 10
        it.distribution = .fill
        it.backgroundColor = .gray
        return it
    }()
    
    lazy var top_sh: OPBContainerSubItemView = {
        let it = OPBContainerSubItemView()
        return it
    }()
    
    lazy var bottom_sh: OPBContainerSubItemView = {
        let it = OPBContainerSubItemView()
        return it
    }()
}

class OPBContainerSubItemView:MSView {
    override func setupUI() {
        addSubview(stack)
        
        stack.addArrangedSubview(left_sh)
        stack.addArrangedSubview(right_sh)
    }
    
    override func setupLayout() {
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        left_sh.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        right_sh.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }
    
    lazy var stack: UIStackView = {
        let it = UIStackView()
        it.axis = .horizontal
        it.spacing = 10
        it.distribution = .fillEqually
        return it
    }()
    
    
    lazy var left_sh: MSShimmerContainerView = {
        let it = MSShimmerContainerView()
        it.backgroundColor = .red
        return it
    }()
    
    lazy var right_sh: MSShimmerContainerView = {
        let it = MSShimmerContainerView()
        it.backgroundColor = .green
        return it
    }()
}

