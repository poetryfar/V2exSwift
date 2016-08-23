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
    
    lazy var request:AllPointAPIManager = {
        let manager = AllPointAPIManager()
        return manager
    }()
    override func viewDidLoad() {
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        setCenterTitle("V2ex")
        
        let segment:UISegmentedControl = UISegmentedControl.init(items: ["1","2","3","4"])
        segment.frame = CGRectMake(0, 0, self.view.width, 40)
        self.view.addSubview(segment)
        segment.addTarget(self, action: #selector(clickButton), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func clickButton() -> Void {
        self.request.startRequest()
    }
}