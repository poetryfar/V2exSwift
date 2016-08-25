//
//  UIView+Additions.swift
//  V2exSwift
//
//  Created by pengbi on 16/6/29.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    var height:CGFloat{
        set{
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        get{
            return self.bounds.size.height
        }
    }
    
    var width:CGFloat{
        set{
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
        get{
            return self.bounds.size.width
        }
    }
    var right:CGFloat{
        set{
            var frame = self.frame
            frame.origin.x  = newValue - frame.width
            self.frame = frame
        }
        get{
            return self.frame.size.width + self.frame.origin.x
        }
    }
    var left:CGFloat{
        set{
            var frame = self.frame
            frame.origin.x  = newValue
            self.frame = frame
        }
        get{
            return self.frame.origin.x
        }
    }
    var centerX:CGFloat{
        set{
            let frame = self.frame
            self.center = CGPointMake(newValue, CGRectGetMidY(frame))
        }
        get{
            return self.center.x
        }
    }
    var centerY:CGFloat{
        set{
            let frame = self.frame
            self.center = CGPointMake(CGRectGetMidX(frame), newValue)
        }
        get{
            return self.center.y
        }
    }
    
}