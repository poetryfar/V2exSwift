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
    
}