//
//  HomeVCFirstCell.swift
//  TTKG_Merchant
//
//  Created by macmini on 16/8/1.
//  Copyright © 2016年 yd. All rights reserved.
//

import UIKit
import SDWebImage

class HomeVCFirstCell: UICollectionViewCell {
    
    var name = UILabel()
    let smallImage = UIImageView()
    var icon = UIImageView()
    
    var iconUrl = String(){
        didSet{
            self.icon.sd_setImageWithURL(NSURL(string : serverPicUrl + iconUrl))
        }
    }

    var nameStr = String(){
        didSet{
            self.name.text = nameStr
            
        }
    }

    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
        self.addSubview(name)
        
        name.textAlignment = NSTextAlignment.Center

        name.snp_makeConstraints { (make) in
            
            make.top.equalTo(0).offset(15)
            make.width.equalTo(self.frame.width)
            make.top.equalTo(0).offset(15)
            
        }
       
        
        self.addSubview(icon)
        icon.snp_makeConstraints { (make) in
            
            make.height.equalTo(60)
            make.left.equalTo(0).offset(20)
            make.right.equalTo(0).offset(-20)
            make.bottom.equalTo(0).offset(-15)
        }
        
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    
    
    
    
    
    
}
