//
//  AllPointAPIManager.swift
//  V2exSwift
//
//  Created by pengbi on 16/8/6.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation
protocol AllPointAPIManagerDelegate{
    func  getAllPointSuccess(returnData:AnyObject,dataType:APIDataType) -> Void
    func  getAllPointFailure(error:NSError) -> Void
}
class AllPointAPIManager: BaseAPIManager,APIManagerProtocol{
    
    weak var delegate:AnyObject?
    
    func apiGetResponse(data: AnyObject?, type: APIDataType) {
        if let letDelgate = delegate as? AllPointAPIManagerDelegate {
        }
    }
    
    func apiMethod() -> APIMethod {
         return .GET
    }
    func apiPath() -> String {
        let nodeUrl = BaseAPIManager.baseURL + "/api/nodes/all.json"
        return nodeUrl
    }
    func apiHeader() -> [String : String]? {
        return nil
    }
    func apiParameter() -> [String : AnyObject]? {
        return nil
    }
    
}