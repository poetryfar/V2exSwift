//
//  Network.swift
//  V2exSwift
//
//  Created by pengbi on 16/7/23.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class Network {
    static let baseURL = "https://www.v2ex.com"
    func request() -> Void {
        Alamofire.request(.GET, "http://baidu.com")
        .responseJSON { Response in
            Response.data
        }
    }
    class func requestAllPoint(falure:(String)->Void,success:(AnyObject)->Void) -> Void {
        let nodeUrl = Network.baseURL + "/api/nodes/all.json"
        Alamofire.request(.GET, nodeUrl)
        .responseJSON { Response in
            if let adata  = Response.data{
                let json =  JSON.init(data: adata)
                success(adata)
            }
        }
    }
    
}