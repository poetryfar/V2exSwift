//
//  RootViewController.swift
//  V2exSwift
//
//  Created by pengbi on 16/6/29.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation
import UIKit
class  RootViewController: UIViewController{
    let segmentControl:HMSegmentedControl = HMSegmentedControl.init(sectionTitles: ["1","2","3","4","5"])
    override func viewDidLoad() {
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        setCenterTitle("V2ex")
        
        self.view.addSubview(segmentControl)
        segmentControl.backgroundColor = UIColor.grayColor()
        segmentControl.frame = CGRectMake(0, 0, self.view.width, 40)
        segmentControl.indexChangeBlock = {(selectedIndex :Int) ->Void in
            if 0 == selectedIndex {
                
            }
            else if 1 == selectedIndex
            {
                
            }
        }
    }
    
    func clickButton() -> Void {
        
    }
}