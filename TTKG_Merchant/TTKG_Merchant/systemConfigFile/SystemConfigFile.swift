//
//  SystemConfigFile.swift
//  TTKG_Merchant
//
//  Created by yd on 16/7/29.
//  Copyright © 2016年 yd. All rights reserved.
//

import Foundation
import UIKit

let screenWith = UIScreen.mainScreen().bounds.width
let screenHeigh = UIScreen.mainScreen().bounds.height

/******************************************************************/
/******************************************************************/
/******************************************************************/

 /// 联网标记
var onlineState = true
 /// 无网络连接
let onlineErrorMsg = "无可以网络"

 /// 服务器接口地址
let serverUrl = "http://58.16.130.51:8800"
 /// 图片地址
let serverPicUrl = "http://58.16.130.51:8888"



/******************************************************************/
/******************************************************************/
/******************************************************************/

//当前服务器时间和本地手机时间差(用于签名)
var timeDifferenceValue = String()

/**
 服务器绝对时间，由于签名
 
 - parameter timeDifferenceValue:当前服务器与本机的时间差
 
 - returns: return value 当前服务器的时间
 */

func serverAbsoluteTime() -> String {
    var time = String() //- timeDifferenceValue
    
    return time
}


/**
 参数加密
 
 - parameter data: data description
 - parameter time: time description
 
 - returns: return value description
 */
func signParameters_MD5_RSA(parameters:[String],time:String) -> String {
    
    
    var data = String()
    for item in parameters {
        data += String(item)
    }
    
    let key = "68A6BB9A2E47F5D620A20F34D399FC698DEB77DE"//待加密的key，参数加密成功后拼接在后面
    let str_MD5 = (data + time + key).md5()
    NSLog("str_MD5 == \(str_MD5)")
    let rsa = RSA_Encryptor.sharedRSA_Encryptor()
    let publicKeyPath = NSBundle.mainBundle().pathForResource("public_key", ofType: "der")
    rsa.loadPublicKeyFromFile(publicKeyPath)
    let encryptedString = rsa.rsaEncryptString(str_MD5)
    NSLog("加密:\n \(encryptedString)")
    return encryptedString
}
/******************************************************************/
/******************************************************************/
/******************************************************************/
