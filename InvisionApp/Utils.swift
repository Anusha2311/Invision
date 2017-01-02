//
//  Utils.swift
//  Vesta
//
//  Created by Pushkar Pandey on 3/18/16.
//  Copyright © 2016 Rare Mile. All rights reserved.
//

import Foundation


struct Utils {
    
    struct UserDefaults {
        
        static func setObject(value: AnyObject?, forKey: String) {
            if value == nil {
                NSUserDefaults.standardUserDefaults().removeObjectForKey(forKey)
            } else {
                NSUserDefaults.standardUserDefaults().setObject(value, forKey: forKey)
            }
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        static func getObject(forKey: String) -> AnyObject? {
            return NSUserDefaults.standardUserDefaults().objectForKey(forKey)
        }
        
        static func setBool(value : Bool , forKey:String){
            NSUserDefaults.standardUserDefaults().setBool(value, forKey: forKey)
        }
        
        static func getBool(forKey: String)->Bool{
            return NSUserDefaults.standardUserDefaults().boolForKey(forKey)
        }
        
    }
    /**
     Use this method to parse the JSON based on the key that returns a String type.
     
     :param: info The JSON in the dictionary format
     :param: key  The key which is used to extract the value from the JSON.
     
     :returns: The String value for the given key in the info object. If the parsing fails, the default value as given by the GlobalConstants.ParseConstants.
     */
    static func stringValueOrDefaultStringOfInfo(info:AnyObject, forKey key:String) -> String {
        if let value = info.valueForKey(key) as? String {
            return value
        }
        //println("Failed to parse the string value forKey: \(key)")
        return Constants.ParseConstants.DEFAULT_STRING
    }
    
    /**
     Use this method to parse the JSON based on the key that returns a object(NSData) type.
     
     :param: info The JSON in the dictionary format
     :param: key  The key which is used to extract the value from the JSON.
     
     :returns: The object value for the given key in the info object. If the parsing fails, the empty object
     */
    static func objectValueOrDefaultObjectOfInfo(info:AnyObject, forKey key:String) -> AnyObject {
        if let value = info.valueForKey(key) as? NSDictionary {
            return value
        }
        //println("Failed to parse the string value forKey: \(key)")
        
        return NSNull()
    }
    /**
     Returns the JSON string for Swift's Dictionary representation
     
     :param: dictionary Dictionary which you would want to convert to JSON string
     
     :returns: JSON string for the given dictionary. `nil` if it not a valid JSON.
     */
    static func JSONStringForDictionary(dictionary:Dictionary<String,AnyObject>) -> String? {
        do{
            
            let jsonData = try NSJSONSerialization.dataWithJSONObject(dictionary, options: NSJSONWritingOptions.PrettyPrinted)
            
            return NSString(data:jsonData, encoding: NSUTF8StringEncoding) as String?
            
        }
        catch{
            
        }
        return nil
    }
    
    static func numberValueOrDefaultNumberOfInfo(info:AnyObject, forKey key:String) -> NSNumber {
        if let value = info.valueForKey(key) as? NSNumber {
            return value
        }
        //println("Failed to parse the string value forKey: \(key)")
        return Constants.ParseConstants.DEFAULT_NUMBER
    }
    /*
     Set default number value to 0
     */
    static func numberValueOrZeroOfInfo(info:AnyObject, forKey key:String) -> NSNumber {
        if let value = info.valueForKey(key) as? NSNumber {
            return value
        }
        //println("Failed to parse the string value forKey: \(key)")
        return 0
    }
    /*
     Set default slider value to 0
     */
    static func numberValueOrDefaultSliderfInfo(info:AnyObject, forKey key:String) -> NSNumber {
        if let value = info.valueForKey(key) as? NSNumber {
            return value
        }
        //println("Failed to parse the string value forKey: \(key)")
        return 5
    }
    
    static func DoubleOrDefault(info:String)->String{
        if (info == ""){
            return "-1"
        }
        else{
            return info
        }
        
    }
    
    /**
     Use this method to parse the JSON based on the key that returns an Array type. This method takes care of downcasting the content of your array to the type that you may like through this code example. If you are expecting an array of numbers to be parsed implement like so:
     
     let numbers:[NSNumber] = Utils.arrayValueOrEmptyArrayOfInfo(info,"key")//a's type will be [NSNumber]
     
     Note that the method will not crash if the contents of the array are not of the specified type. It will simply return an empty array.
     However, if you are not sure of the type information of the object or simply if you don't care about the type, declare the type as `AnyObject`. The method will return an array of AnyObjects. Here is an example:
     let anyObjects:[AnyObject] = Utils.arrayValueOrEmptyArrayOfInfo(info,"key") //a's type will be [AnyObject]
     
     :param: info The JSON in the dictionary format
     :param: key  The key which is used to extract the value from the JSON.
     
     :returns: The Bool value for the given key in the info object. If the parsing fails, it returns an empty array    */
    static func arrayValueOrEmptyArrayOfInfo<T:Any>(info:AnyObject, forKey key:String) -> [T] {
        if let value = info.valueForKey(key) as? [T] {
            return value
        }
        //println("Failed to parse the array value forKey: \(key)")
        return []
    }
    
    
    /**
     Returns the value of the object. If it is the default object, it returns an instance of NSNull() class
     */
    static func valueIfNotDefaultOrNull(object:AnyObject) -> AnyObject {
        if let number = object as? NSNumber where number == Constants.ParseConstants.DEFAULT_NUMBER {
            return NSNull()
        }
        if let string = object as? String where string == Constants.ParseConstants.DEFAULT_STRING {
            return NSNull()
        }
        if let date = object as? NSDate where date == Constants.ParseConstants.DEFAULT_DATA {
            return NSNull()
        }
        return object
    }
}
