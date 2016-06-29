//
//  UIColor+Hex.swift
//  JDWish
//
//  Created by pengbi on 15/12/20.
//  Copyright © 2015年 JingDong. All rights reserved.
//

import Foundation
import UIKit
extension UIColor
{
    static func color(hex aHex:Int,alpha:CGFloat)->UIColor{
        return UIColor.init(red: CGFloat(((aHex & 0xFF0000)>>16)) / 255.0, green:CGFloat(((aHex & 0xFF00)>>8)) / 255.0 , blue: CGFloat(aHex & 0xFF) / 255.0, alpha: alpha);
    }
    static func color(hex aHex:Int)->UIColor{
        return UIColor.color(hex: aHex, alpha: 1);
    }
}