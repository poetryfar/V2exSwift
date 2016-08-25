//
//  Node.swift
//  V2exSwift
//
//  Created by pengbi on 16/8/23.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation
import ObjectMapper
class Node:  Mappable{
    var createTime:NSDate?
    var footer:String?
    var header:String?
    var id:Int?
    var name:String?
    var title:String?
    var titleAlternative:String?
    var topics:Int?
    var url:String?
    
    required init?(_ map: Map) {
        
    }
    func mapping(map: Map) {
        createTime <- (map["created"],DateTransform())
        footer     <- map["footer"]
        header     <- map["header"]
        id         <- map["id"]
        name       <- map["name"]
        title      <- map["title"]
        topics     <- map["topics"]
        url        <- map["url"]
        titleAlternative    <- map["title_alternative"]
    }
}
