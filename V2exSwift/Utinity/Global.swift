//
//  Global.swift
//  JDWish
//
//  Created by pengbi on 16/4/20.
//  Copyright © 2016年 JingDong. All rights reserved.
//

import Foundation
import UIKit
class JDGlobal {
    class func isIos7Plus()->Bool{
            let processInfo:NSProcessInfo = NSProcessInfo.processInfo()
            var version:NSOperatingSystemVersion = NSOperatingSystemVersion()
            version.majorVersion = 7
            version.minorVersion = 0
            version.patchVersion  = 0
            return processInfo.isOperatingSystemAtLeastVersion(version)
    }
    class var screenHeight:CGFloat{
        return UIScreen.mainScreen().bounds.size.height
    }
    class var screenWidth:CGFloat{
        return UIScreen.mainScreen().bounds.size.width;
    }
    class var systemVersion:String{
        return UIDevice.currentDevice().systemVersion
    }
    class var systemName:String{
        return UIDevice.currentDevice().systemName
    }
    class var model:String{
        return UIDevice.currentDevice().model;
    }
    class var channel:String{
        return "appStore"
    }
    class var udidString:String{
        let  string = NSUserDefaults.standardUserDefaults().stringForKey("")
        if let string_ = string{
            return string_
        }
        return ""
    }
    class  var appVersion:String{
        let version =  NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String
        return version!
    }
    class var appCode:String{
        let version =  NSBundle.mainBundle().infoDictionary?["CFBundleVersion"] as? String
        return version!
    }
    private class var parameter:[String:String] {
        var  parameterDic = [String:String]()
        parameterDic["uuid"] = self.udidString
        parameterDic["app_channel"] = self.channel
        parameterDic["version"] = self.appVersion
        parameterDic["version_code"] = self.appCode
        parameterDic["os"] = "IOS"
        parameterDic["os_version"] = self.systemVersion
        parameterDic["platform"] = self.model
        parameterDic["screen"] =  String(self.screenHeight) + "x" + String(self.screenWidth)
        return parameterDic
    }
    class func  requestParameters()->[String:String]{
        var para = self.parameter;
        let time = NSDate().timeIntervalSince1970 * 1000;
        para["timestamp"] = String(time)
        return para
    }
}
