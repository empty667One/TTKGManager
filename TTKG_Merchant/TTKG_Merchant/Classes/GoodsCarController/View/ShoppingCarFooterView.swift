//
//  ShoppingCarFooterView.swift
//  TTKG_Merchant
//
//  Created by iosnull on 16/8/4.
//  Copyright © 2016年 yd. All rights reserved.
//

import Foundation
import SnapKit


class ShoppingCarFooterView:UIView {
    //起配金额
    var shippingAmount = UILabel()
    //商家活动
    var merchantActivity = UILabel()
    
    private let line = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(shippingAmount)
        self.addSubview(merchantActivity)
        
        shippingAmount.font = UIFont.systemFontOfSize(12)
        merchantActivity.font = UIFont.systemFontOfSize(12)
        merchantActivity.textColor = UIColor.redColor()
        
        shippingAmount.snp_makeConstraints { (make) in
            make.left.equalTo(40)
            make.right.equalTo(0)
            make.height.equalTo(14)
            make.top.equalTo(4)
        }
        
        merchantActivity.snp_makeConstraints { (make) in
            make.left.equalTo(shippingAmount.snp_left)
            make.right.bottom.equalTo(0)
            make.top.equalTo(shippingAmount.snp_bottom)
        }
        
        
        self.addSubview(line)
        line.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(1)
        }
        line.backgroundColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}