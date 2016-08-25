//
//  User.swift
//  V2exSwift
//
//  Created by pengbi on 16/8/23.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation
import ObjectMapper
class User: Mappable{
    var userName:String?
    var age:Int?
    required init?(_ map: Map) {
        
    }
    func mapping(map: Map) {
        
    }
}