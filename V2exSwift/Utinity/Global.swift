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
        if #available(iOS 8.0, *) {
            let processInfo:NSProcessInfo = NSProcessInfo.processInfo()
            var version:NSOperatingSystemVersion = NSOperatingSystemVersion()
            version.majorVersion = 7
            version.minorVersion = 0
            version.patchVersion  = 0
            return processInfo.isOperatingSystemAtLeastVersion(version)
        }
        else
        {
            let version:String = self.systemVersion
            return Float(version) > 7
        }
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
        let  string = NSUserDefaults.standardUserDefaults().stringForKey(USERDEFAULT_KEY_UUID)
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
    class func getWiFiAddress() -> String{
        var address : String?
        
        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs> = nil
        if getifaddrs(&ifaddr) == 0 {
            
            // For each interface ...
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr.memory.ifa_next }
                
                let interface = ptr.memory
                
                // Check for IPv4 or IPv6 interface:
                let addrFamily = interface.ifa_addr.memory.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    // Check interface name:
                    if let name = String.fromCString(interface.ifa_name) where name == "en0" {
                        
                        // Convert interface address to a human readable string:
                        var addr = interface.ifa_addr.memory
                        var hostname = [CChar](count: Int(NI_MAXHOST), repeatedValue: 0)
                        getnameinfo(&addr, socklen_t(interface.ifa_addr.memory.sa_len),
                                    &hostname, socklen_t(hostname.count),
                                    nil, socklen_t(0), NI_NUMERICHOST)
                        address = String.fromCString(hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        if  let address_ = address
        {
            return address_
        }
        return ""
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
        let wifi = JDGlobal.getWiFiAddress();
        parameterDic["app_ip"] =  wifi
        return parameterDic
    }
    class func  requestParameters()->[String:String]{
        var para = self.parameter;
        let time = NSDate().timeIntervalSince1970 * 1000;
        para["timestamp"] = String(time)
        return para
    }
}
