//
//  OPBTableContentCell.swift
//  MSShimmer_Example
//
//  Created by zz on 30.7.25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit

class OPBTableContentCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLab)
        titleLab.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.greaterThanOrEqualTo(40)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    lazy var titleLab: UILabel = {
        let it = UILabel()
        it.font = UIFont.systemFont(ofSize: 15)
        it.textColor = .red
        it.text = "contentcontentcontentcontentcontentcontentcontentcontentcontentcontent"
        it.numberOfLines = 0
        return it
        
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
