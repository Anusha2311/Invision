//
//  Request.swift
//  InvisionApp
//
//  Created by Anusha on 12/30/16.
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
