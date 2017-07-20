//
//  HomeVCSecondHeaderView.swift
//  TTKG_Merchant
//
//  Created by macmini on 16/8/4.
//  Copyright © 2016年 yd. All rights reserved.
//

import UIKit

class HomeVCSecondHeaderView: UICollectionReusableView {
 
    let titleLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        titleLabel.snp_makeConstraints(closure: { (make) in
            make.centerX.equalTo(0)
            make.centerY.equalTo(0)
        })

        titleLabel.textColor = UIColor.grayColor()
        titleLabel.font = UIFont.systemFontOfSize(15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
