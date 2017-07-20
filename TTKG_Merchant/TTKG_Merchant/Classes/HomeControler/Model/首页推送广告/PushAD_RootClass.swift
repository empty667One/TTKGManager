//
//	PushAD_RootClass.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class PushAD_RootClass : NSObject, NSCoding{

	var code : Int!
	var data : PushAD_Data!
	var msg : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		code = dictionary["code"] as? Int
		if let dataData = dictionary["data"] as? NSDictionary{
			data = PushAD_Data(fromDictionary: dataData)
		}
		msg = dictionary["msg"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if code != nil{
			dictionary["code"] = code
		}
		if data != nil{
			dictionary["data"] = data.toDictionary()
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
         data = aDecoder.decodeObjectForKey("data") as? PushAD_Data
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