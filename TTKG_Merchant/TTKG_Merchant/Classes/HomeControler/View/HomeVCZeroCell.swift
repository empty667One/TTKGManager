//
//  HomeVCZeroCell.swift
//  TTKG_Merchant
//
//  Created by macmini on 16/8/2.
//  Copyright © 2016年 yd. All rights reserved.
//

import UIKit

class HomeVCZeroCell: UICollectionViewCell {
    
    
    let btn1 = UIButton()
    let btn2 = UIButton()
    let btn3 = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        btn1.backgroundColor = UIColor.yellowColor()
        btn2.backgroundColor = UIColor.redColor()
        btn3.backgroundColor = UIColor.blueColor()
        
        self.addSubview(btn1)
        btn1.snp_makeConstraints { (make) in
            make.left.equalTo(0).offset(2)
            make.width.equalTo((screenWith - 20) / 3)
            make.top.equalTo(0).offset(5)
            make.bottom.equalTo(0).offset(-5)
            
        }
        //点击满赠按钮
        btn1.addTarget(self, action: #selector(self.btn1Click), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.addSubview(btn3)
        btn3.snp_makeConstraints { (make) in
            make.right.equalTo(0).offset(-2)
            make.width.equalTo((screenWith - 20) / 3)
            make.top.equalTo(0).offset(5)
            make.bottom.equalTo(0).offset(-5)
            
        }
        //点击供应商按钮
        btn3.addTarget(self, action: #selector(self.btn3Click), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        self.addSubview(btn2)
        btn2.snp_makeConstraints { (make) in
            make.left.equalTo(btn1.snp_right).offset(10)
            make.right.equalTo(btn3.snp_left).offset(-10)
            make.top.equalTo(0).offset(5)
            make.bottom.equalTo(0).offset(-5)
            
        }

        //点击热卖按钮
        btn2.addTarget(self, action: #selector(self.btn2Click), forControlEvents: UIControlEvents.TouchUpInside)
       
    }
    
    
    //按钮的点击事件
    func btn1Click() {
        
        print("点击了满赠")
    }
    
    func btn2Click() {
        
        print("点击了热卖")
    }
    
    func btn3Click() {
        
        print("点击了供应商")
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
