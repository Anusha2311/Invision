//
//  NetworkServiceHelper.swift
//  InvisionApp
//
//  Created by Anusha on 12/30/16.
//  Copyright © 2016 Rare Mile. All rights reserved.
//

import Foundation
import Alamofire
import Lock
import ObjectMapper

enum MultiFileUploadType {
    case CommentImageUpload
}

class NetworkServiceHelper {
    private let TAG = "NetworkServiceHelper"
    
    private var currentEncoding : ParameterEncoding?
    private var currentMethod : Alamofire.Method?
    private var currentHeaders : [String: String]?
    private var currentParams : [String:AnyObject]?
    private var currentURL : String?
    var shouldURLEncode : Bool?
    
    weak var delegate : NetworkServiceHelperDelegate?
    
    
    
    internal enum MimeType : String{
        case JPEG           = "image/jpeg"
        case Bitmap         = "image/bmp"
        case PNG            = "image/png"
        case TIIFF          = "image/tiff"
        case PDF            = "application/pdf"
        case Presentation   = "application/vnd.openxmlformats-officedocument.presentationml.presentation"
        case Spreadsheet    = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        case Document       = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        case Text           = "text/plain"
        case RTF            = "text/richtext"
         case MULTIPART      = "multipart/form-data"
    }
    
    internal enum ResponseType : String{
        case JSON       = "json"
        case DATA       = "data"
    }
    
    /**
     Prepare the singleton instance of Network helper
     */
    class var sharedInstance: NetworkServiceHelper {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: NetworkServiceHelper? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = NetworkServiceHelper()
        }
        return Static.instance!
    }
    
    /**
     Method to cancel all outstanding/currently running tasks
     */
    func cancelAllTasks(){
        Alamofire.Manager.sharedInstance.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            for task in dataTasks {
                task.cancel()
            }
            for task in uploadTasks {
                task.cancel()
            }
            for task in downloadTasks {
                task.cancel()
            }
        }
    }
    
    /**
     Method that determines the HTTP method to be used
     */
    private func prepareHTTPMethod(methodString:String) {
        if methodString.caseInsensitiveCompare("post") == .OrderedSame {
            NetworkServiceHelper.sharedInstance.currentMethod = .POST
        } else if methodString.caseInsensitiveCompare("put") == .OrderedSame {
            NetworkServiceHelper.sharedInstance.currentMethod = .PUT
        } else if methodString.caseInsensitiveCompare("patch") == .OrderedSame {
            NetworkServiceHelper.sharedInstance.currentMethod = .PATCH
        } else if methodString.caseInsensitiveCompare("delete") == .OrderedSame {
            NetworkServiceHelper.sharedInstance.currentMethod = .DELETE
        } else {
            NetworkServiceHelper.sharedInstance.currentMethod = .GET
        }
    }
    
    
    /**
     Method that prepares the HTTP headers to be used
     */
    private func prepareHTTPHeaders(headers : [String : String]?){
        NetworkServiceHelper.sharedInstance.currentHeaders = [:]
        if headers != nil{
            NetworkServiceHelper.sharedInstance.currentHeaders = headers!
        }
        if let jwtString = Utils.UserDefaults.getObject(Constants.UserDefaultKeys.AUTH0_JWT_TOKEN_KEY) as? String where jwtString != ""{
            NetworkServiceHelper.sharedInstance.currentHeaders!["Authorization"] = "Bearer \(jwtString)"
        }
    }
    
    /**
     Method that determines the HTTP encoding to be used
     */
    private func prepareHTTPEncoding(){
        if NetworkServiceHelper.sharedInstance.currentMethod == .GET {
            NetworkServiceHelper.sharedInstance.currentEncoding = ParameterEncoding.URLEncodedInURL
        }else{
            NetworkServiceHelper.sharedInstance.currentEncoding = ParameterEncoding.JSON
        }
    }
    
    /**
     Method that handles the offline scenario
     */
    private func handleNoInternetCondition(failure:((error:NSError) -> ())){
        NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_UNAVAILABLE, errorMessage: Constants.ErrorConstants.ErrorMessages.NETWORK_UNAVAILABLE, failure: failure)
    }
    
    /**
     Method that handes the execution of failure block with correct error object
     */
    private func handleFailure(errorCode: Int, errorMessage: String, failure: ((error:NSError) -> ())){
        let failureError = NSError(domain: Constants.ErrorConstants.ErrorDomains.NETWORK_ERROR, code: errorCode, userInfo: [Constants.ErrorConstants.ERROR_MESSAGE_KEY: errorMessage])
        failure(error: failureError)
    }
    
    // MARK: REST Calls
    
    /**
     Method that performs a REST call.
     
     - parameter methodString:              The HTTP method in String to perform the REST call
     - parameter baseURL(default):          The baseURL to be used, defaults to Constants.Networks.BASE_URL
     - parameter urlString:                 The additional URL to be used to make the REST call
     - parameter headers(optional):         The headers to be sent as part of the request
     - parameter params(optional):          The parameters to be sent as part of the request
     - parameter expectedResponse(default): The type of expected response, defaults to JSON
     - parameter success:                   The success closure that contains the response
     - parameter failure:                   The failure closure that contains the error infomation if the request fails
     */
    func performRESTCallWithMethod(
        methodString : String,
        baseURL : String = Constants.Networks.BASE_URL,
        urlString : String,
        headers: [String: String]?,
        params:[String:AnyObject]?,
        expectedResponse: NetworkServiceHelper.ResponseType = NetworkServiceHelper.ResponseType.JSON,
        success:((response:AnyObject?) -> ()),
        failure:((error:NSError) -> ())){
        
        if shouldURLEncode == true{
            NetworkServiceHelper.sharedInstance.currentURL = baseURL + urlString
            shouldURLEncode = false
        }else{
            NetworkServiceHelper.sharedInstance.currentURL = baseURL + urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        }
        
        NetworkServiceHelper.sharedInstance.prepareHTTPMethod(methodString)
        NetworkServiceHelper.sharedInstance.prepareHTTPEncoding()
        NetworkServiceHelper.sharedInstance.prepareHTTPHeaders(headers)
        NetworkServiceHelper.sharedInstance.currentParams = params
        
        switch expectedResponse {
                        case NetworkServiceHelper.ResponseType.JSON:
                            NetworkServiceHelper.sharedInstance.performRESTCallWithJSONResponse(success, failure: failure)
                            break
                        case NetworkServiceHelper.ResponseType.DATA:
                            NetworkServiceHelper.sharedInstance.performRESTCallWithDataResponse(success, failure: failure)
                            break
                        default:
                            NetworkServiceHelper.sharedInstance.performRESTCallWithJSONResponse(success, failure: failure)
                            break
                        }
        
//        //if Utils.isConnectedToNetwork(){
//            switch expectedResponse {
//            case NetworkServiceHelper.ResponseType.JSON:
//                NetworkServiceHelper.sharedInstance.performRESTCallWithJSONResponse(success, failure: failure)
//                break
//            case NetworkServiceHelper.ResponseType.DATA:
//                NetworkServiceHelper.sharedInstance.performRESTCallWithDataResponse(success, failure: failure)
//                break
//            default:
//                NetworkServiceHelper.sharedInstance.performRESTCallWithJSONResponse(success, failure: failure)
//                break
//            }
//        }else{
//            NetworkServiceHelper.sharedInstance.handleNoInternetCondition(failure)
//        }
    }
    
    
    /*func performRESTCallWithMethodForPropertyBySelfTag(
        methodString : String,
        baseURL : String = Constants.Networks.BASE_URL2,
        urlString : String,
        headers: [String: String]?,
        params:[String:AnyObject]?,
        expectedResponse: NetworkServiceHelper.ResponseType = NetworkServiceHelper.ResponseType.JSON,
        success:((response:AnyObject?) -> ()),
        failure:((error:NSError) -> ())){
        
        if shouldURLEncode == true{
            NetworkServiceHelper.sharedInstance.currentURL = baseURL + urlString
            shouldURLEncode = false
        }else{
            NetworkServiceHelper.sharedInstance.currentURL = baseURL + urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        }
        
        NetworkServiceHelper.sharedInstance.prepareHTTPMethod(methodString)
        NetworkServiceHelper.sharedInstance.prepareHTTPEncoding()
        NetworkServiceHelper.sharedInstance.prepareHTTPHeaders(headers)
        NetworkServiceHelper.sharedInstance.currentParams = params
        if Utils.isConnectedToNetwork(){
            switch expectedResponse {
            case NetworkServiceHelper.ResponseType.JSON:
                NetworkServiceHelper.sharedInstance.performRESTCallWithJSONResponse(success, failure: failure)
                break
            case NetworkServiceHelper.ResponseType.DATA:
                NetworkServiceHelper.sharedInstance.performRESTCallWithDataResponse(success, failure: failure)
                break
            default:
                NetworkServiceHelper.sharedInstance.performRESTCallWithJSONResponse(success, failure: failure)
                break
            }
        }else{
            NetworkServiceHelper.sharedInstance.handleNoInternetCondition(failure)
        }
    }*/

    
    private func performRESTCallWithJSONResponse(success:((response:AnyObject?) -> ()), failure:((error:NSError) -> ())){
        Alamofire.Manager.sharedInstance.request(currentMethod!, currentURL!, parameters: currentParams, encoding: currentEncoding!, headers: currentHeaders).debugLog().validate(statusCode: 200..<300).responseJSON(completionHandler:{(response:Response<AnyObject, NSError>) in
            //Log.v(self.TAG, message: "Response : \(response.result.value)")
            print("Respone: \(response)")
            switch response.result {
            case .Success:
               // 
                success(response: response.result.value)
                break
            case .Failure:
                if response.response?.statusCode == 401{
                    //
                }
                let data = response.data
                do{
                    let errorDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! NSDictionary
                    let message = errorDictionary.valueForKey("message") as? String
                    if let _ = message{
                        NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: message!, failure: failure)
                    }else{
                        var msg: String?
                        switch response.response!.statusCode{
                        case 400...499:
                            msg = Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR_400
                            break
                        case 500...599:
                            msg = Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR_500
                            break
                        default:
                            msg = Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR
                            break
                        }
                        NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: msg!, failure: failure)
                    }
                }catch {
                    NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR, failure: failure)
                }
                break
            }
        })
    }
    
    private func performRESTCallWithDataResponse(success:((response:AnyObject?) -> ()), failure:((error:NSError) -> ())){
        
        /*
        Alamofire.Manager.sharedInstance.request(currentMethod!, currentURL!, parameters: currentParams, encoding: currentEncoding!, headers: currentHeaders).debugLog().progress{ bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
            Log.d(self.TAG, message: "bytesWritten: \(bytesWritten)")
            Log.d(self.TAG, message: "totalBytesWritten: \(totalBytesWritten)")
            Log.d(self.TAG, message: "totalBytesExpectedToWrite: \(totalBytesExpectedToWrite)")
            self.delegate?.networkServiceHelperDownloadProgress(Int(Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)*100))
            }.responseData({(response:Response<NSData, NSError>) in
                Log.v(self.TAG, message: "Response : \(response.result.value)")
                switch response.result {
                case .Success:
                    success(response: response.data)
                    break
                case .Failure:
                    if response.response?.statusCode == 401{
                        
                    }
                    let data = response.data
                    do{
                        let errorDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! NSDictionary
                        let message = errorDictionary.valueForKey("message") as? String
                        if let _ = message{
                            NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: message!, failure: failure)
                        }else{
                            var msg: String?
                            switch response.response!.statusCode{
                            case 400...499:
                                msg = Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR_400
                                break
                            case 500...599:
                                msg = Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR_500
                                break
                            default:
                                msg = Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR
                                break
                            }
                            NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: msg!, failure: failure)
                        }
                    }catch {
                        NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR, failure: failure)
                    }
                    break
                }
            })
         */
        
        Alamofire.Manager.sharedInstance.request(currentMethod!, currentURL!, parameters: currentParams, encoding: currentEncoding!, headers: currentHeaders).debugLog().progress { (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) in
        
            self.delegate?.networkServiceHelperDownloadProgress(Int(Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)*100))
            }.responseData {(response:Response<NSData, NSError>) in
                
                switch response.result {
                case .Success:
                    success(response: response.data)
                    break
                case .Failure:
                    if response.response?.statusCode == 401{
                        //
                    }
                    let data = response.data
                    do{
                        let errorDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! NSDictionary
                        let message = errorDictionary.valueForKey("message") as? String
                        if let _ = message{
                            NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: message!, failure: failure)
                        }else{
                            var msg: String?
                            switch response.response!.statusCode{
                            case 400...499:
                                msg = Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR_400
                                break
                            case 500...599:
                                msg = Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR_500
                                break
                            default:
                                msg = Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR
                                break
                            }
                            NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: msg!, failure: failure)
                        }
                    }catch {
                        NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR, failure: failure)
                    }
                    break
                }
        }
        
    }
    
    // MARK: MutliPart Upload Calls - Single Upload
    
    /**
     Method that performs a REST call.
     
     - parameter fileName:              The name of the file to be uploaded
     - parameter fileType:              The type of the file
     - parameter fileData(optional):    The data of the file
     - parameter fileURL(optional):     The URL to the file
     - parameter mimeType:              The mime type to be used for the file
     - parameter urlString:             The additional URL to be used to make the REST call
     - parameter headers(optional):     The headers to be sent as part of the request
     - parameter params(optional):      The parameters to be sent as part of the request
     - parameter success:               The success closure that contains the response
     - parameter failure:               The failure closure that contains the error infomation if the request fails
     */
    func performMultiPartFileUpload(
        fileName : String,
        methodString : String,
        name:String,
        fileType : String,
        fileData : NSData?,
        fileURL: NSURL?,
        mimeType: MimeType,
        urlString : String,
        headers: [String : String]?,
        params: [String : AnyObject]?,
        success:((response:AnyObject?) -> ()),
        failure:((error:NSError) -> ())){
        NetworkServiceHelper.sharedInstance.currentURL = Constants.Networks.BASE_URL + urlString
        NetworkServiceHelper.sharedInstance.prepareHTTPMethod(methodString)
        NetworkServiceHelper.sharedInstance.prepareHTTPEncoding()
        NetworkServiceHelper.sharedInstance.prepareHTTPHeaders(headers)
        NetworkServiceHelper.sharedInstance.currentParams = params
//        if Utils.isConnectedToNetwork(){
//            if let _ = fileData{
//                NetworkServiceHelper.sharedInstance.performMultiPartFileUploadWithFileData(fileName,  fileType: fileType,name:name,methodString : NetworkServiceHelper.sharedInstance.currentMethod, fileData: fileData!, mimeType: mimeType, success: success, failure: failure)
//            }else{
//                NetworkServiceHelper.sharedInstance.performMultiPartFileUploadWithFileURL(fileName, fileType: fileType, fileURL: fileURL!, mimeType: mimeType, success: success, failure: success)
//            }
//        }else{
//            NetworkServiceHelper.sharedInstance.handleNoInternetCondition(failure)
//        }
    }
    
    // MARK: MutliPart Upload Calls - Single Upload with progress
    
    /**
     Method that performs a REST call with progress call back.
     
     - parameter fileName:              The name of the file to be uploaded
     - parameter fileType:              The type of the file
     - parameter fileData(optional):    The data of the file
     - parameter fileURL(optional):     The URL to the file
     - parameter mimeType:              The mime type to be used for the file
     - parameter urlString:             The additional URL to be used to make the REST call
     - parameter headers(optional):     The headers to be sent as part of the request
     - parameter params(optional):      The parameters to be sent as part of the request
     - parameter success:               The success closure that contains the response
     - parameter progress:              The progress closure that containts progress information
     - parameter failure:               The failure closure that contains the error infomation if the request fails
     */
    func performMultiPartFileUpload(
        fileName : String,
        methodString : String,
        name:String,
        fileType : String,
        fileData : NSData?,
        fileURL: NSURL?,
        mimeType: MimeType,
        urlString : String,
        headers: [String : String]?,
        params: [String : AnyObject]?,
        success:((response:AnyObject?) -> ()),
        progress: ((progress:Float)->()),
        failure:((error:NSError) -> ())){
        NetworkServiceHelper.sharedInstance.currentURL = Constants.Networks.BASE_URL + urlString
        NetworkServiceHelper.sharedInstance.prepareHTTPMethod(methodString)
        NetworkServiceHelper.sharedInstance.prepareHTTPEncoding()
        NetworkServiceHelper.sharedInstance.prepareHTTPHeaders(headers)
        NetworkServiceHelper.sharedInstance.currentParams = params
        NetworkServiceHelper.sharedInstance.performMultiPartFileUploadWithFileData(fileName,  fileType: fileType,name:name,methodString : NetworkServiceHelper.sharedInstance.currentMethod, fileData: fileData!, mimeType: mimeType, success: success, progress: progress, failure: failure)
//        if Utils.isConnectedToNetwork(){
//            if let _ = fileData{
//                NetworkServiceHelper.sharedInstance.performMultiPartFileUploadWithFileData(fileName,  fileType: fileType,name:name,methodString : NetworkServiceHelper.sharedInstance.currentMethod, fileData: fileData!, mimeType: mimeType, success: success, progress: progress, failure: failure)
//            }else{
//                NetworkServiceHelper.sharedInstance.performMultiPartFileUploadWithFileURL(fileName, fileType: fileType, fileURL: fileURL!, mimeType: mimeType, success: success, progress: progress, failure: success)
//            }
//        }else{
//            NetworkServiceHelper.sharedInstance.handleNoInternetCondition(failure)
//        }
    }
    
     // MARK: MutliPart Upload Calls - Multiple Upload
    
    /**
     Method that performs a REST call.
     
     - parameter fileType:              The type of the file
     - parameter fileData(optional):    The data of the file
     - parameter fileURL(optional):     The URL to the file
     - parameter mimeType:              The mime type to be used for the file
     - parameter urlString:             The additional URL to be used to make the REST call
     - parameter headers(optional):     The headers to be sent as part of the request
     - parameter params(optional):      The parameters to be sent as part of the request
     - parameter success:               The success closure that contains the response
     - parameter failure:               The failure closure that contains the error infomation if the request fails
     - parameter uploadType:            The API type to know the request structure.
     */
    
    func performMultiPartFileUploadForMultipleFiles(
        fileType : String,
        methodString : String,
        mimeType: MimeType,
        urlString : String,
        fileURL: NSURL?,
        headers: [String : String]?,
        params: AnyObject?,
        uploadType: MultiFileUploadType?,
        success:((response:AnyObject?) -> ()),
        failure:((error:NSError) -> ())){
        NetworkServiceHelper.sharedInstance.currentURL = Constants.Networks.BASE_URL + urlString
        NetworkServiceHelper.sharedInstance.prepareHTTPMethod(methodString)
        NetworkServiceHelper.sharedInstance.prepareHTTPEncoding()
        NetworkServiceHelper.sharedInstance.prepareHTTPHeaders(headers)
    }
    
    //MARK: Helper methods - without progress
    
    private func performMultiPartFileUploadWithFileData(
        fileName : String,
        fileType : String,
        name:String,
        methodString : Alamofire.Method?,
        fileData : NSData,
        mimeType: MimeType,
        success:((response:AnyObject?) -> ()),
        failure:((error:NSError) -> ())){
        Alamofire.Manager.sharedInstance.upload(methodString!,currentURL!,headers: currentHeaders,
            multipartFormData: {
                multipartFormData in
                multipartFormData.appendBodyPart(data: fileData, name: name , fileName: fileName, mimeType: mimeType.rawValue)
                for (key,value) in self.currentParams!{
                    multipartFormData.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name :key)
                }}) {
                encodingResult in
                switch encodingResult{
                case .Success(let upload, _, _):
                    upload.debugLog().validate(statusCode: 200..<300).progress{ bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
                        self.delegate?.networkServiceHelperUploadProgress(Int(Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)*100))
                        }.responseJSON { response in
                           // print("Response : \(response)")
                            switch response.result {
                            case .Success:
                                success(response: response.result.value)
                                
                                break
                            case .Failure:
                                if response.response?.statusCode == 401{
                                    //
                                }
                                NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR, failure: failure)
                                break
                            }
                        }
                case .Failure(let encodingError): break
                    
            }
        }
    }
    
    private func performMultiPartFileUploadWithFileURL(
        fileName : String,
        fileType : String,
        fileURL: NSURL,
        mimeType: MimeType,
        success:((response:AnyObject?) -> ()),
        failure:((error:NSError) -> ())){
        Alamofire.Manager.sharedInstance.upload(.POST, currentURL!, headers: currentHeaders,
            multipartFormData: {
                multipartFormData in
                multipartFormData.appendBodyPart(fileURL: fileURL, name: "document", fileName: fileName, mimeType: mimeType.rawValue)
                for (key,value) in self.currentParams!{
                    multipartFormData.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name :key)
                }}) {
                    encodingResult in
                    switch encodingResult{
                    case .Success(let upload, _, _):
                        upload.debugLog().validate(statusCode: 200..<300).progress{ bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
                            self.delegate?.networkServiceHelperUploadProgress(Int(Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)*100))
                        }.responseJSON {
                            response in
                            
                            switch response.result {
                            case .Success:
                                success(response: response.result.value)
                                break
                            case .Failure:
                                if response.response?.statusCode == 401{
                                    
                                }
                                NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage:  Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR, failure: failure)
                                break
                        }
                    }
                    case .Failure(let encodingError): break
                        
            }
        }
    }
    
    /*
     For multiple file upload
     */
    
    private func performMultiPartMultipleFileUploadWithFileData(
        fileType : String,
        name:String,
        methodString : Alamofire.Method?,
        mimeType: MimeType,
        params: AnyObject,
        uploadType: MultiFileUploadType?,
        success:((response:AnyObject?) -> ()),
        failure:((error:NSError) -> ())) {
        Alamofire.Manager.sharedInstance.upload(methodString!,currentURL!,headers: currentHeaders, multipartFormData: {
            multipartFormData in
        
            
        }) {
            encodingResult in
            switch encodingResult{
            case .Success(let upload, _, _):
                upload.debugLog().validate(statusCode: 200..<300).progress{ bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
                    self.delegate?.networkServiceHelperUploadProgress(Int(Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)*100))
                    }.responseJSON { response in
                        
                        switch response.result {
                        case .Success:
                            success(response: response.result.value)
                            break
                        case .Failure:
                            if response.response?.statusCode == 401{
                                
                            }
                            NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR, failure: failure)
                            break
                        }
                }
            case .Failure(let encodingError):
                break
            }
        }
    }

    //MARK: Helper methods with progress
    private func performMultiPartFileUploadWithFileData(
        fileName : String,
        fileType : String,
        name:String,
        methodString : Alamofire.Method?,
        fileData : NSData,
        mimeType: MimeType,
        success:((response:AnyObject?) -> ()),
        progress: ((progress:Float)->()),
        failure:((error:NSError) -> ())){
        Alamofire.Manager.sharedInstance.upload(methodString!,currentURL!,headers: currentHeaders,
            multipartFormData: {
                
            multipartFormData in
            multipartFormData.appendBodyPart(data: fileData, name: name , fileName: fileName, mimeType: mimeType.rawValue)
//            for (key,value) in self.currentParams!{
//                multipartFormData.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name :key)
//            }
        }) {
                encodingResult in
                switch encodingResult{
                case .Success(let upload, _, _):
                    upload.debugLog().validate(statusCode: 200..<300).progress{ bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
                        progress(progress: Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)*100)
                        }.responseJSON { response in
                           
                            switch response.result {
                            case .Success:
                                success(response: response.result.value)
                                break
                            case .Failure:
                                if response.response?.statusCode == 401{
                                    
                                }
                                NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage: Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR, failure: failure)
                                break
                            }
                    }
                case .Failure(let encodingError): break
                
                }
        }
    }
    
    private func performMultiPartFileUploadWithFileURL(
        fileName : String,
        fileType : String,
        fileURL: NSURL,
        mimeType: MimeType,
        success:((response:AnyObject?) -> ()),
        progress: ((progress:Float)->()),
        failure:((error:NSError) -> ())){
        Alamofire.Manager.sharedInstance.upload(.POST, currentURL!, headers: currentHeaders,
            multipartFormData: {
            multipartFormData in
            multipartFormData.appendBodyPart(fileURL: fileURL, name: "document", fileName: fileName, mimeType: mimeType.rawValue)
            for (key,value) in self.currentParams!{
                multipartFormData.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name :key)
            }}) {
                encodingResult in
                switch encodingResult{
                case .Success(let upload, _, _):
                    upload.debugLog().validate(statusCode: 200..<300).progress{ bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
                        self.delegate?.networkServiceHelperUploadProgress(Int(Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)*100))
                        }.responseJSON {
                            response in
                           
                            switch response.result {
                            case .Success:
                                success(response: response.result.value)
                                break
                            case .Failure:
                                if response.response?.statusCode == 401{
                                    
                                }
                                NetworkServiceHelper.sharedInstance.handleFailure(Constants.ErrorConstants.ErrorCodes.NETWORK_ERROR, errorMessage:  Constants.ErrorConstants.ErrorMessages.NETWORK_ERROR, failure: failure)
                                break
                            }
                    }
                case .Failure(let encodingError): break
                
                }
        }
    }
    
    
}

protocol NetworkServiceHelperDelegate: class {
    func networkServiceHelperUploadProgress(percent : Int)
    func networkServiceHelperDownloadProgress(percent : Int)
}
