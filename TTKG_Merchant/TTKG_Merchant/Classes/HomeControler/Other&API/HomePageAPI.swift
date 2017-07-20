//
//  HomeAPI.swift
//  TTKG_Merchant
//
//  Created by yd on 16/8/1.
//  Copyright © 2016年 yd. All rights reserved.
//

import Foundation

/*
 接口调用函数
 
 //网络请求所有数据
 func requestDefaultDataFromServer(roleid: Int, areaid: Int)
 
 //上拉加载更多商家列表
 func requestMoreMerchantData(roleid: Int)
 
 //请求模型的数据，返回值为元组
 func getHomePageDataFromModel()
 
 //需要接受的通知：1、HomePageAPI_SendErrorMsg  显示错误信息，停止上下拉
                2、HomePageModelChanged    收到通知就可以调用getHomePageDataFromModel获取模型里面的数据
 
 */

/// 注册API （外观模式）
class HomePageAPI:HomePageHTTPClientDelegate{
    /*单例*/
    static let shareInstance = HomePageAPI()
    private  init() {
        
        persistencyManager = HomePageManager()
        httpClient = HomePageHTTPClient()
        httpClient.delegate = self
    }
    
    private let persistencyManager:HomePageManager
    private let httpClient:HomePageHTTPClient
    
    
    /********************************************************/
    /********************************************************/
    /********************************************************/
    /**
     从服务器获取首页默认数据（等同于下拉刷新）
     */
    func requestDefaultDataFromServer(roleid: Int, areaid: Int)  {
        if onlineState {
            httpClient.requestScrollAD_Data(roleid.description, areaid: areaid.description)
            httpClient.requestPushAD_Data(roleid.description, areaid: areaid.description)
            httpClient.requestGoodsBrandData()
            httpClient.requestGoodsClassificationData()
            
            //清空商家列表
            persistencyManager.merchantInfoDatas = []
            httpClient.requestMerchantData(1100, usertype: 1, page: 1, count: 20)
        }else{
            homePageAPI_SendErrorMsg(onlineErrorMsg, status: "404")
        }
    }
    
    /**
     上拉加载更多
     
     - parameter roleid: roleid description
     */
    func requestMoreMerchantData(roleid: Int){
        let page = (persistencyManager.merchantInfoDatas.count) / 20
        httpClient.requestMerchantData(roleid, usertype: 1, page: page + 1, count:20)
    }
    
    /********************************************************/
    /********************************************************/
    /********************************************************/
    
    /**
     从模型获取首页需要的全部数据
     */
    func getHomePageDataFromModel() ->(pushAD_Data:PushAD_Data?,scrollADDatas:[ScrollADData]?,goodsBrandDatas:[GoodsBrandData]?,goodsClassificationDatas:[GoodsClassificationData]?,merchantInfoDatas:[MerchantInfoData]?) {
        let pushAD_Data             = persistencyManager.pushAD_Data
        let scrollADDatas           = persistencyManager.scrollADDatas
        let goodsBrandDatas         = persistencyManager.goodsBrandDatas
        let goodsClassificationDatas = persistencyManager.goodsClassificationDatas
        let merchantInfoDatas       = persistencyManager.merchantInfoDatas
        
        return (pushAD_Data,scrollADDatas,goodsBrandDatas,goodsClassificationDatas,merchantInfoDatas)
    }
    
    /********************************************************/
    /********************************************************/
    /********************************************************/
    internal  func responsePushAD_Data(model:PushAD_RootClass){
        if model.code == 0 {
            persistencyManager.pushAD_Data = model.data
        }else{
            homePageAPI_SendErrorMsg(model.msg, status: "404")
        }
        
    }
    internal  func responseScrollAD_Data(model:ScrollADRootClass){
        if model.code == 0 {
            persistencyManager.scrollADDatas = model.data
        }else{
            homePageAPI_SendErrorMsg(model.msg, status: "404")
        }
    }
    internal  func responseGoodsClassificationData(model:GoodsClassificationRootClass){
        if model.code == 0 {
            persistencyManager.goodsClassificationDatas = model.data
        }else{
            homePageAPI_SendErrorMsg(model.msg, status: "404")
        }
    }
    internal  func responseGoodsBrandData(model:GoodsBrandRootClass){
        if model.code == 0 {
            persistencyManager.goodsBrandDatas = model.data
        }else{
            homePageAPI_SendErrorMsg(model.msg, status: "404")
        }
    }
    
    internal func responseMerchantData(model:MerchantInfoRootClass){
        if model.code == 0 {
            
            persistencyManager.addMerchantInfoDatas(model.data)
        }else{
            homePageAPI_SendErrorMsg(model.msg, status: "404")
        }
    }
    /********************************************************/
    /********************************************************/
    /********************************************************/
    private func homePageAPI_SendErrorMsg(errorMsg:String,status:String){
        let errorContent = ["errorMsg":errorMsg,"status":status]
        let notice:NSNotification =  NSNotification(name: "HomePageAPI_SendErrorMsg", object: errorContent)
        NSNotificationCenter.defaultCenter().postNotification(notice)
    }
    
}