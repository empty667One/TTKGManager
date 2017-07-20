//
//	PushAD_Data.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class PushAD_Data : NSObject, NSCoding{

	var datatype : Int! = Int()
	var picurl : String! = String()
	var productid : Int! = Int()
	var remark : String! = String()
	var shopid : Int! = Int()
	var title : String! = String()


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		datatype = dictionary["datatype"] as? Int
		picurl = dictionary["picurl"] as? String
		productid = dictionary["productid"] as? Int
		remark = dictionary["remark"] as? String
		shopid = dictionary["shopid"] as? Int
		title = dictionary["title"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if datatype != nil{
			dictionary["datatype"] = datatype
		}
		if picurl != nil{
			dictionary["picurl"] = picurl
		}
		if productid != nil{
			dictionary["productid"] = productid
		}
		if remark != nil{
			dictionary["remark"] = remark
		}
		if shopid != nil{
			dictionary["shopid"] = shopid
		}
		if title != nil{
			dictionary["title"] = title
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         datatype = aDecoder.decodeObjectForKey("datatype") as? Int
         picurl = aDecoder.decodeObjectForKey("picurl") as? String
         productid = aDecoder.decodeObjectForKey("productid") as? Int
         remark = aDecoder.decodeObjectForKey("remark") as? String
         shopid = aDecoder.decodeObjectForKey("shopid") as? Int
         title = aDecoder.decodeObjectForKey("title") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if datatype != nil{
			aCoder.encodeObject(datatype, forKey: "datatype")
		}
		if picurl != nil{
			aCoder.encodeObject(picurl, forKey: "picurl")
		}
		if productid != nil{
			aCoder.encodeObject(productid, forKey: "productid")
		}
		if remark != nil{
			aCoder.encodeObject(remark, forKey: "remark")
		}
		if shopid != nil{
			aCoder.encodeObject(shopid, forKey: "shopid")
		}
		if title != nil{
			aCoder.encodeObject(title, forKey: "title")
		}

	}

}