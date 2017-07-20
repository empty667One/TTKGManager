//
//  ClassifyModel.swift
//  TTKG_Merchant
//
//  Created by yd on 16/8/1.
//  Copyright © 2016年 yd. All rights reserved.
//

import Foundation



class ClassifyModel : NSObject, NSCoding{
    
    var code : Int!
    var data : [CData]!
    var msg : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        code = dictionary["code"] as? Int
        data = [CData]()
        if let dataArray = dictionary["data"] as? [NSDictionary]{
            for dic in dataArray{
                let value = CData(fromDictionary: dic)
                data.append(value)
            }
        }
        msg = dictionary["msg"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if code != nil{
            dictionary["code"] = code
        }
        if data != nil{
            var dictionaryElements = [NSDictionary]()
            for dataElement in data {
                dictionaryElements.append(dataElement.toDictionary())
            }
            dictionary["data"] = dictionaryElements
        }
        if msg != nil{
            dictionary["msg"] = msg
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        code = aDecoder.decodeObjectForKey("code") as? Int
        data = aDecoder.decodeObjectForKey("data") as? [CData]
        msg = aDecoder.decodeObjectForKey("msg") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encodeWithCoder(aCoder: NSCoder)
    {
        if code != nil{
            aCoder.encodeObject(code, forKey: "code")
        }
        if data != nil{
            aCoder.encodeObject(data, forKey: "data")
        }
        if msg != nil{
            aCoder.encodeObject(msg, forKey: "msg")
        }
        
    }
    
}