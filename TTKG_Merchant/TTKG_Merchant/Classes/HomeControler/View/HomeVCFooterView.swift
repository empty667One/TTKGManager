//
//  HomeVCFooterView.swift
//  TTKG_Merchant
//
//  Created by macmini on 16/8/5.
//  Copyright © 2016年 yd. All rights reserved.
//

import UIKit

class HomeVCFooterView: UICollectionReusableView {
    
    
    let addImage = UIImageView()
    
    var picurl : String?{
        didSet{
            if picurl != nil {
                self.addImage.sd_setImageWithURL(NSURL(string : serverPicUrl + picurl!))
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(addImage)
        addImage.snp_makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
