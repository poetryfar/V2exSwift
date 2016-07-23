//
//  Network.swift
//  V2exSwift
//
//  Created by pengbi on 16/7/23.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation
import Alamofire
class Network {
    func request() -> Void {
        Alamofire.request(.GET, "http://baidu.com")
        .responseJSON { Response in
            Response.data
        }
    }
}