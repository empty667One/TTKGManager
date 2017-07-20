//
//  HomeVCThirdCell.swift
//  TTKG_Merchant
//
//  Created by macmini on 16/8/1.
//  Copyright © 2016年 yd. All rights reserved.
//

import UIKit

class HomeVCThirdCell: UICollectionViewCell {

    @IBOutlet weak var deliverImage: UIImageView!

    @IBOutlet weak var deliverName: UILabel!
    
    @IBOutlet weak var entenBtn: UIButton!
    
    @IBOutlet weak var qiDing: UILabel!
    
    @IBOutlet weak var orderLabel: UILabel!
    
    
    @IBOutlet weak var goodImage1: UIImageView!
   
    @IBOutlet weak var goodImage2: UIImageView!
    
    @IBOutlet weak var goodImage3: UIImageView!
    
    @IBOutlet weak var goodImage4: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        entenBtn.layer.borderWidth = 1
        entenBtn.layer.borderColor = UIColor.redColor().CGColor
        entenBtn.layer.cornerRadius = 6
        entenBtn.layer.masksToBounds = true
        
        qiDing.layer.cornerRadius = 8
        qiDing.layer.masksToBounds = true
        
        
        entenBtn.addTarget(self, action: #selector(HomeVCThirdCell.enterBtnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        entenBtn.adjustsImageWhenHighlighted = false
        
        
        //为图片添加手势
        goodImage1.userInteractionEnabled = true
        let tapG1 = UITapGestureRecognizer(target: self, action: #selector(self.goodImage1Click))
        goodImage1.addGestureRecognizer(tapG1)
        
        goodImage2.userInteractionEnabled = true
        let tapG2 = UITapGestureRecognizer(target: self, action: #selector(self.goodImage2Click))
        goodImage2.addGestureRecognizer(tapG2)
        
        goodImage3.userInteractionEnabled = true
        let tapG3 = UITapGestureRecognizer(target: self, action: #selector(self.goodImage3Click))
        goodImage3.addGestureRecognizer(tapG3)
        
        goodImage4.userInteractionEnabled = true
        let tapG4 = UITapGestureRecognizer(target: self, action: #selector(self.goodImage4Click))
        goodImage4.addGestureRecognizer(tapG4)
    }

    
    func enterBtnClick(btn : UIButton) {
        
        print("进店")
    }
    
    
    //图片的点击事件
    func goodImage1Click() {
        
        print("点击图片1")
    }
    func goodImage2Click() {
        
        print("点击图片2")
    }

    func goodImage3Click() {
        
        print("点击图片3")
    }

    func goodImage4Click() {
        
        print("点击图片4")
    }

}
