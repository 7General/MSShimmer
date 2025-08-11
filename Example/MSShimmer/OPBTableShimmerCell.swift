//
//  OPBTableShimmerCell.swift
//  MSShimmer_Example
//
//  Created by zz on 30.7.25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit
import MSShimmer

class OPBTableShimmerCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLab)
        titleLab.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    lazy var titleLab: MSShimmerContainerView = {
        let it = MSShimmerContainerView()
        return it
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
