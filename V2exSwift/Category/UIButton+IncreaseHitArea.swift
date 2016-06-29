//
//  UIButton+IncreaseHitArea.swift
//  JDWish
//
//  Created by pengbi on 16/4/29.
//  Copyright © 2016年 JingDong. All rights reserved.
//

import Foundation
import UIKit
private var  KEY_HIT_TEST_EDGE_INSETSL:String = "KEY_HIT_TEST_EDGE_INSETSL"
extension UIButton
{
    var hitTestEdgeInsets:UIEdgeInsets{
        get{
            let insetString = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETSL) as? NSString
            if insetString != nil
            {
                return UIEdgeInsetsFromString(insetString as! String)
            }
            else{
                return  UIEdgeInsetsZero
            }
        }
        set{
            let  value = NSStringFromUIEdgeInsets(newValue)
            objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETSL, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            

        }
    }
    public override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        if  UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero){
            return super.pointInside(point, withEvent: event)
        }
        let  hitFreame = UIEdgeInsetsInsetRect(self.bounds, self.hitTestEdgeInsets);
        return CGRectContainsPoint(hitFreame, point)
        
    }
}
