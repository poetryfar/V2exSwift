//
//  UILabel+Additions.swift
//  JDWish
//
//  Created by pengbi on 16/4/29.
//  Copyright © 2016年 JingDong. All rights reserved.
//

import Foundation
import UIKit
extension UILabel
{
    static func createLabel(aligment:NSTextAlignment,backgroundColor:UIColor,text:String,font:UIFont,textColor:UIColor) -> UILabel{
        let  label = UILabel.init()
        label.text = text
        label.textAlignment = aligment
        label.backgroundColor = backgroundColor
        label.font = font
        label.textColor = textColor
        return label
    }
}