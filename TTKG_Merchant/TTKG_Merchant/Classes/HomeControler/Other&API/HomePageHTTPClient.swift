//
//  HomeHTTPClientDelegate.swift
//  TTKG_Merchant
//
//  Created by iosnull on 16/8/2.
//  Copyright (c) 2016年 yd. All rights reserved.
//

import Foundation
import Alamofire

protocol HomePageHTTPClientDelegate {
    func responsePushAD_Data(model:PushAD_RootClass)
    func responseScrollAD_Data(model:ScrollADRootClass)
    func responseGoodsClassificationData(model:GoodsClassificationRootClass)
    func responseGoodsBrandData(model:GoodsBrandRootClass)
    func responseMerchantData(model:MerchantInfoRootClass)
}

class HomePageHTTPClient {
    
    var delegate:HomePageHTTPClientDelegate?
    
    
    /**
     获取推送广告
     */
    func requestPushAD_Data(roleid:String,areaid:String)  {
        let url = serverUrl + "/home/adpush"
        var p = ["roleid":roleid,"areaid":areaid]
        
//        //签名
//        let parametersValue:[String] = [roleid,areaid]
//        let sign = signParameters_MD5_RSA(parametersValue, time:serverAbsoluteTime())
//        p["sign"] = sign
        
        Alamofire.request(.GET, url, parameters:p )
            .responseString { response -> Void in
                switch response.result {
                case .Success:
                    let dict:NSDictionary?
                    do {
                        dict = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                        
                        self.delegate?.responsePushAD_Data(PushAD_RootClass.init(fromDictionary: dict!))
                        
                    }catch _ {
                        self.homePageAPI_SendErrorMsg(onlineErrorMsg, status: "404")
                    }
                    
                    
                case .Failure(let _):
                    self.homePageAPI_SendErrorMsg(onlineErrorMsg, status: "404")
                }
                
        }
    }
    
    /**
     获取轮播图
     */
    func requestScrollAD_Data(roleid:String,areaid:String)  {
        let url = serverUrl + "/home/adlist"
        var p = ["roleid":roleid,"areaid":areaid]
        
//        //签名
//        let parametersValue:[String] = [roleid,areaid]
//        let sign = signParameters_MD5_RSA(parametersValue, time:serverAbsoluteTime())
//        p["sign"] = sign
        
        Alamofire.request(.POST, url, parameters:p )
            .responseString { response -> Void in
                switch response.result {
                case .Success:
                    let dict:NSDictionary?
                    do {
                        dict = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                        
                        self.delegate?.responseScrollAD_Data(ScrollADRootClass.init(fromDictionary: dict!))
                        
                    }catch _ {
                        self.homePageAPI_SendErrorMsg(onlineErrorMsg, status: "404")
                    }
                    
                    
                case .Failure(let _):
                    self.homePageAPI_SendErrorMsg(onlineErrorMsg, status: "404")
                }
                
        }
    }
    
    /**
     获取类别分类
     */
    func requestGoodsClassificationData(){
        let url = serverUrl + "/home/category"
        Alamofire.request(.GET, url, parameters:nil )
            .responseString { response -> Void in
                switch response.result {
                case .Success:
                    let dict:NSDictionary?
                    do {
                        dict = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                        
                        self.delegate?.responseGoodsClassificationData(GoodsClassificationRootClass.init(fromDictionary: dict!))
                        
                    }catch _ {
                        self.homePageAPI_SendErrorMsg(onlineErrorMsg, status: "404")
                    }
                    
                    
                case .Failure(let _):
                    self.homePageAPI_SendErrorMsg(onlineErrorMsg, status: "404")
                }
                
        }
    }
    
    /**
     获取商品品牌分类
     */
    func requestGoodsBrandData(){
        let url = serverUrl + "/home/brand"
        Alamofire.request(.GET, url, parameters:nil )
            .responseString { response -> Void in
                switch response.result {
                case .Success:
                    let dict:NSDictionary?
                    do {
                        dict = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                        
                        self.delegate?.responseGoodsBrandData(GoodsBrandRootClass.init(fromDictionary: dict!))
                        
                    }catch _ {
                        self.homePageAPI_SendErrorMsg(onlineErrorMsg, status: "404")
                    }
                    
                    
                case .Failure(let _):
                    self.homePageAPI_SendErrorMsg(onlineErrorMsg, status: "404")
                }
                
        }
    }
    
    
    /**
     首页商家列表
     
     - parameter userid:   用户id
     - parameter usertype: 用户类型
     - parameter page:     当前第几页
     - parameter count:    每页显示多少条数据
     */
    func requestMerchantData(userid:Int,usertype:Int,page:Int,count:Int) {
        let url = serverUrl + "/home/shoplist"
        var p = ["userid":userid.description,"usertype":usertype.description,"page":page.description,"count":count.description]
        print(userid)
//        //签名
//        let parametersValue:[String] = [userid.description,usertype.description,page.description,count.description]
//        let sign:String = signParameters_MD5_RSA(parametersValue, time:serverAbsoluteTime())
//        p["sign"] = sign
        
        Alamofire.request(.GET, url, parameters:p )
            .responseString { response -> Void in
                switch response.result {
                case .Success:
                    let dict:NSDictionary?
                    do {
                        dict = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                        
                        self.delegate?.responseMerchantData(MerchantInfoRootClass.init(fromDictionary: dict!))
                        
                    }catch _ {
                        self.homePageAPI_SendErrorMsg(onlineErrorMsg, status: "404")
                    }
                    
                    
                case .Failure(let _):
                    self.homePageAPI_SendErrorMsg(onlineErrorMsg, status: "404")
                }
                
        }
    }
    
    private func homePageAPI_SendErrorMsg(errorMsg:String,status:String){
        let errorContent = ["errorMsg":errorMsg,"status":status]
        let notice:NSNotification =  NSNotification(name: "HomePageAPI_SendErrorMsg", object: errorContent)
        NSNotificationCenter.defaultCenter().postNotification(notice)
    }
    
}