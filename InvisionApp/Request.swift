//
//  Request.swift
//  Vesta
//
//  Created by Samrat Shekhar on 4/19/16.
//  Copyright © 2016 Rare Mile. All rights reserved.
//

import Foundation
import Alamofire

extension Request {
    public func debugLog() -> Self {
        debugPrint(self)
        return self
    }
}