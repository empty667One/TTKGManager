//
//  HomeVCHeaderView.swift
//  TTKG_Merchant
//
//  Created by macmini on 16/8/2.
//  Copyright © 2016年 yd. All rights reserved.
//

import UIKit

class HomeVCHeaderView: UICollectionReusableView {
    
    
    let scrollImage = UIImageView()
    let bottomView = UIView()
    let separateView = UIView()
    let message = UILabel()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        bottomView.backgroundColor = UIColor.whiteColor()
        separateView.backgroundColor = UIColor(red: 236 / 255, green: 237 / 255, blue: 239 / 255, alpha: 1)
        
        
        self.addSubview(separateView)
        separateView.snp_makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(3)
            
            
        }
        
        
        self.addSubview(bottomView)
        bottomView.snp_makeConstraints { (make) in
            make.bottom.equalTo(separateView.snp_top).offset(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(40)
            
        }

        
        self.addSubview(scrollImage)
        scrollImage.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(bottomView.snp_top).offset(0)
        }
        
        
        self.bottomView.addSubview(message)
        message.snp_makeConstraints { (make) in
            make.left.equalTo(0).offset(20)
            make.top.equalTo(0).offset(10)
        }
        
        //富文本设置
        let attributeString = NSMutableAttributedString(string:"快购资讯 : ")
        
        
        //设置字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(),
                                     range: NSMakeRange(2, 2))
        //从文本0开始4个字符字体HelveticaNeue-Bold,14号
        attributeString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue", size: 13)!,
        range: NSMakeRange(0,4))
    
        
        message.attributedText = attributeString
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
