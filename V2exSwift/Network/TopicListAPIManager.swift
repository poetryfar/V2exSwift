//
//  TopicListAPIManager.swift
//  V2exSwift
//
//  Created by pengbi on 16/8/25.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation

protocol TopicListAPIManagerDelegate{
    func  getTopicSuccess(returnData:AnyObject,dataType:APIDataType) -> Void
    func  getTopicFailure(error:NSError) -> Void
}
class TopicListAPIManager: BaseAPIManager ,APIManagerProtocol{
    var topicId:Int64?
    var delegate:AnyObject?
    
    func apiMethod() -> APIMethod {
        return APIMethod.GET
    }
    func apiPath() -> String {
        return BaseAPIManager.baseURL + "api/topics/show.json"
    }
    func apiHeader() -> [String : String]? {
        return nil
    }
    
    func apiParameter() -> [String : AnyObject]? {
        if let topicid = topicId {
            return ["node_id":String(topicid)]
        }else{
           assert(false,"topic 不对")
           return nil
        }
    }
    
    func apiGetResponse(data: AnyObject?, type: APIDataType) {
        if let aDelegte = self.delegate as? TopicListAPIManagerDelegate {
            if let aData = data  as? NSError {
                aDelegte.getTopicFailure(aData)
            }
            else{
                aDelegte.getTopicSuccess(data ?? "", dataType: type)
            }
            
        }
    }
}