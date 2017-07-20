//
//	TData.swift
//
//	Create by yd on 4/8/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class TData : NSObject, NSCoding{

	var address : String!
	var areaid : Int!
	var keyid : Int!
	var loginid : String!
	var name : String!
	var picurl : String!
	var roleid : Int!
	var shopname : String!
	var tel : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		address = dictionary["address"] as? String
		areaid = dictionary["areaid"] as? Int
		keyid = dictionary["keyid"] as? Int
		loginid = dictionary["loginid"] as? String
		name = dictionary["name"] as? String
		picurl = dictionary["picurl"] as? String
		roleid = dictionary["roleid"] as? Int
		shopname = dictionary["shopname"] as? String
		tel = dictionary["tel"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if address != nil{
			dictionary["address"] = address
		}
		if areaid != nil{
			dictionary["areaid"] = areaid
		}
		if keyid != nil{
			dictionary["keyid"] = keyid
		}
		if loginid != nil{
			dictionary["loginid"] = loginid
		}
		if name != nil{
			dictionary["name"] = name
		}
		if picurl != nil{
			dictionary["picurl"] = picurl
		}
		if roleid != nil{
			dictionary["roleid"] = roleid
		}
		if shopname != nil{
			dictionary["shopname"] = shopname
		}
		if tel != nil{
			dictionary["tel"] = tel
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         address = aDecoder.decodeObjectForKey("address") as? String
         areaid = aDecoder.decodeObjectForKey("areaid") as? Int
         keyid = aDecoder.decodeObjectForKey("keyid") as? Int
         loginid = aDecoder.decodeObjectForKey("loginid") as? String
         name = aDecoder.decodeObjectForKey("name") as? String
         picurl = aDecoder.decodeObjectForKey("picurl") as? String
         roleid = aDecoder.decodeObjectForKey("roleid") as? Int
         shopname = aDecoder.decodeObjectForKey("shopname") as? String
         tel = aDecoder.decodeObjectForKey("tel") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if address != nil{
			aCoder.encodeObject(address, forKey: "address")
		}
		if areaid != nil{
			aCoder.encodeObject(areaid, forKey: "areaid")
		}
		if keyid != nil{
			aCoder.encodeObject(keyid, forKey: "keyid")
		}
		if loginid != nil{
			aCoder.encodeObject(loginid, forKey: "loginid")
		}
		if name != nil{
			aCoder.encodeObject(name, forKey: "name")
		}
		if picurl != nil{
			aCoder.encodeObject(picurl, forKey: "picurl")
		}
		if roleid != nil{
			aCoder.encodeObject(roleid, forKey: "roleid")
		}
		if shopname != nil{
			aCoder.encodeObject(shopname, forKey: "shopname")
		}
		if tel != nil{
			aCoder.encodeObject(tel, forKey: "tel")
		}

	}

}