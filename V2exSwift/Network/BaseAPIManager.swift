//
//  BaseAPIManager.swift
//  V2exSwift
//
//  Created by pengbi on 16/8/6.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
enum APIMethod:String {
    case GET,POST
}
enum APIDataType:Int {
    case Dictionary,Array,Number,String,Bool,Null
}
extension Type
{
    func convertToAPIDataTyepe() -> APIDataType {
        switch self {
        case .Array:
            return APIDataType.Array
        case .Dictionary:
            return APIDataType.Dictionary
        case .Number:
            return APIDataType.Number
        case .String:
            return APIDataType.String
        case .Bool:
            return APIDataType.Bool
        default:
            return APIDataType.Null
        }
    }
}
protocol  APIManagerProtocol {
    func apiMethod() -> APIMethod
    func apiParameter() -> [String:AnyObject]?
    func apiPath() -> String
    func apiHeader() -> [String:String]?
    func apiGetResponse(data:AnyObject?,type:APIDataType) -> Void
}

class BaseAPIManager{
    static let  baseURL = "https://www.v2ex.com"
    var success = { (data:Any) -> Void in}
    var failure = { (data:Any) -> Void in}
    
    lazy  var  chirld:APIManagerProtocol? = {
        if let my  = self as? APIManagerProtocol{
            return my
        }
        else{
            assert(false, "不能找自己")
        }
        return nil
    }()
    func startRequest() -> Void {
        if let chirld = self.chirld {
            
            var apiMethod:Alamofire.Method = .GET
            switch chirld.apiMethod() {
            case .GET:
                apiMethod = Alamofire.Method.GET
            case .POST:
                apiMethod = Alamofire.Method.POST
            }
            Alamofire.request(apiMethod, chirld.apiPath(), parameters:chirld.apiParameter(), encoding: .URL, headers: chirld.apiHeader()).responseJSON(completionHandler: { [weak self] (response) in
                if let strongSelf = self{
                    if let aData = response.data{
                        let json = JSON.init(data: aData)
                        strongSelf.success(json)
                        strongSelf.chirld?.apiGetResponse(json.rawValue, type: json.type.convertToAPIDataTyepe())
                        return;
                    }
                    strongSelf.chirld?.apiGetResponse(nil, type: APIDataType.Null)
                }
                
            })
        }
    }
}