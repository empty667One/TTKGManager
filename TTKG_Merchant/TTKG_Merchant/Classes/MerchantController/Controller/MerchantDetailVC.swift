//
//  MerchantDetailVC.swift
//  TTKG_Merchant
//
//  Created by yd on 16/8/5.
//  Copyright © 2016年 yd. All rights reserved.
//

import UIKit
import SnapKit

class MerchantDetailVC: UIViewController {
    let headerView = UIView(frame: CGRect(x: 0, y: 10, width: screenWith, height: 80))
    let merchantImage = UIImageView()
    let merchantName = UILabel()
    let QPLabel = UILabel()//显示起配
    let YHLabel = UILabel()//显示优惠
    let QPMessage = UILabel()//起配信息
    let YHMessage = UILabel()//优惠信息
    let tradeLabel = UILabel()//交易次数
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.addSubview(headerView)
        createUI()
        
    }
    
    func createUI() {
        
        headerView.addSubview(merchantImage)
        headerView.addSubview(merchantName)
        headerView.addSubview(QPLabel)
        headerView.addSubview(QPMessage)
        headerView.addSubview(YHLabel)
        headerView.addSubview(YHMessage)
        headerView.addSubview(tradeLabel)
        
        merchantImage.snp_makeConstraints { (make) in
            make.left.equalTo(0).offset(5)
            make.top.equalTo(0).offset(5)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        merchantImage.image = UIImage(named: "房子")
        merchantImage.backgroundColor = UIColor.redColor()
        
        merchantName.snp_makeConstraints { (make) in
            make.left.equalTo(merchantImage.snp_right).offset(3)
            make.top.equalTo(0).offset(2)
            make.right.equalTo(0).offset(-20)
            make.height.equalTo(20)
        }
        
        merchantName.text = "天涯明月21341542341"
        merchantName.font = UIFont.systemFontOfSize(12)
        
        QPLabel.snp_makeConstraints { (make) in
            make.left.equalTo(merchantImage.snp_right).offset(3)
            make.top.equalTo(merchantName.snp_bottom).offset(3)
            make.width.equalTo(30)
            make.height.equalTo(18)
        }
        QPLabel.backgroundColor = UIColor.redColor()
        QPLabel.text = "起配"
        QPLabel.font = UIFont.systemFontOfSize(10)
        QPLabel.textColor = UIColor.whiteColor()
        QPLabel.textAlignment = NSTextAlignment.Center
        
        QPMessage.snp_makeConstraints { (make) in
            make.left.equalTo(QPLabel.snp_right).offset(3)
            make.top.equalTo(merchantName.snp_bottom).offset(3)
            make.right.equalTo(0).offset(-80)
            make.height.equalTo(18)
        }
        QPMessage.font = UIFont.systemFontOfSize(10)
        QPMessage.text = "满￥300.00起订：每天一次"
        QPMessage.textColor = UIColor.blackColor()
        QPMessage.textAlignment = NSTextAlignment.Left
        
        YHLabel.snp_makeConstraints { (make) in
            make.left.equalTo(merchantImage.snp_right).offset(3)
            make.top.equalTo(QPLabel.snp_bottom).offset(3)
            make.width.equalTo(30)
            make.height.equalTo(18)
        }
        YHLabel.font = UIFont.systemFontOfSize(10)
        YHLabel.backgroundColor = UIColor.orangeColor()
        YHLabel.text = "优惠"
        YHLabel.textColor = UIColor.whiteColor()
        YHLabel.textAlignment = NSTextAlignment.Center
        
        YHMessage.snp_makeConstraints { (make) in
            make.left.equalTo(YHLabel.snp_right).offset(3)
            make.top.equalTo(QPMessage.snp_bottom).offset(3)
            make.right.equalTo(0).offset(-70)
            make.height.equalTo(18)
        }
        
        YHMessage.text = "满￥300.00起订：每天一次"
        YHMessage.textColor = UIColor.blackColor()
        YHMessage.textAlignment = NSTextAlignment.Left
        YHMessage.font = UIFont.systemFontOfSize(10)
        
        tradeLabel.snp_makeConstraints { (make) in
            make.left.equalTo(QPMessage.snp_right).offset(5)
            make.top.equalTo(merchantName.snp_bottom).offset(5)
            make.right.equalTo(0).offset(-1)
            make.height.equalTo(25)
        }
        
        tradeLabel.text = "315 次交易"
        tradeLabel.font = UIFont.systemFontOfSize(11)
        tradeLabel.textAlignment = NSTextAlignment.Center
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
