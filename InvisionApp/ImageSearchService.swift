//
//  ImageSearchService.swift
//  InvisionApp
//
//  Created by Anusha on 12/30/16.
//  Copyright © 2016 Rare Mile. All rights reserved.
//

import Foundation
import ObjectMapper

class ImageSearchService {
    static func sendSearchRequest(params: NSDictionary, imageData : NSData, success: ((response:AnyObject?)->()),failure:((error:NSError)->())) {
    let method = Constants.Networks.POST
    let urlString = "http://13.91.60.5:5000/getTags"
//    let urlString = Constants.Networks.ImageEnhancedSearchConstants.IMAGE_ENHANCED_INFO
    let filename = "image"
//            NetworkServiceHelper.sharedInstance.performRESTCallWithMethod(method, urlString: urlString, headers: nil, params: params as? [String : AnyObject] , success: success, failure: failure)
    
    NetworkServiceHelper.sharedInstance.performMultiPartFileUpload(filename, methodString: "POST", name: "file", fileType: "", fileData: imageData, fileURL: nil, mimeType: .MULTIPART, urlString: urlString, headers: nil, params: params as? [String : AnyObject], success: { (response) in
        success(response: response)
        }, progress: { (progress) in
            
    }) { (error) in
        
    }
}
}
