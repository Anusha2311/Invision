//
//  Constants.swift
//  InvisionApp
//
//  Created by Anusha on 12/30/16.
//  Copyright © 2016 Rare Mile. All rights reserved.
//

import UIKit
import Foundation

/**
 *  Global constants struct that holds all constant values
 */
struct Constants {
    
    struct ErrorConstants {
        static let ERROR_MESSAGE_KEY = "errorMessage"
        
        struct ErrorDomains {
            static let NETWORK_ERROR = "network"
        }
        
        struct ErrorCodes {
            static let NETWORK_ERROR = 0
            static let NETWORK_UNAVAILABLE = 1
            static let NETWORK_ERROR_400 = 400
            static let NETWORK_ERROR_404 = 404
            static let NETWORK_ERROR_500 = 500
            
        }
        
        struct ErrorMessages {
            static let NETWORK_ERROR = "Something went wrong! Please try again."
            static let NETWORK_UNAVAILABLE = "Network Unavailable. Please try again."
            static let NETWORK_ERROR_400 = "Requested material not found."
            static let NETWORK_ERROR_500 = "Invalid request"
        }
    }
    
    struct UserDefaultKeys {
        
        static let AUTH0_JWT_TOKEN_KEY = "auth0_jwt_token_key"
        static let AUTH0_REFRESH_TOKEN_KEY = "auth0_refresh_token_key"
        static let AUTH0_USER_PROFILE_KEY = "auth0_user_profile_key"
        static let DEVICE_TOKEN_KEY = "device_token_key"
        
    }
    
    struct Networks {
        static let GET = "GET"
        static let POST = "POST"
        static let PUT = "PUT"
        static let DELETE = "DELETE"
        static let PATCH = "PATCH"
        static let BASE_URL = ""
    }
    
    struct ParseConstants {
        static let DEFAULT_NUMBER = -1
        //static let DEFAULT_DATE = Utils.defaultDate()
        static let DEFAULT_STRING = ""
        static let DEFAULT_BOOL = false
        static let DEFAULT_DATA = NSData()
    }
    
    //Constant for Grand Dispatch Queue
    static var GlobalMainQueue: dispatch_queue_t {
        return dispatch_get_main_queue()
    }
    
    static var GlobalUserInteractiveQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
    }
    
    static var GlobalUserInitiatedQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
    }
    
    static var GlobalUtilityQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)
    }
    
    static var GlobalBackgroundQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
    }
    
    
}
