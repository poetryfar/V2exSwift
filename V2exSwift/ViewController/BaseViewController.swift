//
//  BaseViewController.swift
//  JDWish
//
//  Created by pengbi on 16/4/19.
//  Copyright © 2016年 JingDong. All rights reserved.
//

import Foundation
import UIKit
enum JDNavigationItemType {
    case  left
    case  right
}
extension UIViewController
{
    func setNavigationBarHidden(hidden:Bool){
        self.navigationController?.navigationBar.hidden = hidden
    }
    func clickBackArrow() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }
    func setBackArrow() -> Void {
        let image = UIImage.init(named: "common_titlebar_back")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let barButton = UIBarButtonItem.init(image: image, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.clickBackArrow))
        self.navigationItem.leftBarButtonItem = barButton
    }
    func  setLeftImage(inout image:UIImage ,target:AnyObject,sel:Selector) -> Void {
        image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let barButton = UIBarButtonItem.init(image: image, style: UIBarButtonItemStyle.Plain, target: target,action: sel)
        self.navigationItem.leftBarButtonItem = barButton;
    }
    func setRightCart(target:AnyObject,sel:Selector) ->Void  {
        let image = UIImage.init(named: "common_titlebar_cart")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let barButton = UIBarButtonItem.init(image: image, style: UIBarButtonItemStyle.Plain, target: target,action: sel)
        self.navigationItem.rightBarButtonItems = [barButton]
    }
    func setRightTitle(title:String,color:UIColor,target:AnyObject,sel:Selector) -> Void{
        let button = UIButton.init(type: UIButtonType.Custom)
        button.setTitle(title, forState: UIControlState.Normal)
        button.setTitleColor(color, forState: UIControlState.Normal)
        button.addTarget(target, action: sel, forControlEvents: UIControlEvents.TouchUpInside)
        button.frame = CGRectMake(0, 0, 57, 57)
        
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    func setCenterImage(image:UIImage) -> Void {
        self.navigationItem.titleView =  UIImageView.init(image: image)
    }
    func  setCenterView(view:UIView) -> Void{
        self.navigationItem.titleView = view
    }
    func setRightView(view:UIView) -> Void {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: view)
    }
    func setLeftItemHidden(hidden:Bool) -> Void {
        if hidden {
            self.navigationItem.leftBarButtonItem = nil
        }
        self.navigationItem.hidesBackButton = hidden
    }
    func setCenterTitle(title:String) -> Void {
        self.navigationItem.title = title
    }
    func setNavigationItemHidden(type:JDNavigationItemType) -> Void {
        switch type {
        case .left:
            self.navigationItem.leftBarButtonItem = nil
        case .right:
            self.navigationItem.rightBarButtonItem  = nil
        }
    }
    
    func getPageId() -> String? {
        return nil
    }
    

}