//
//  RootViewController.swift
//  V2exSwift
//
//  Created by pengbi on 16/6/29.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
class  RootViewController: UIViewController,AllPointAPIManagerDelegate{
    
    static let segmentHeight:CGFloat = 40
    
    lazy var request:AllPointAPIManager = {
        let manager = AllPointAPIManager()
        manager.delegate = self
        return manager
    }()
    
    lazy var segment:UISegmentedControl  = {
        let segment:UISegmentedControl = UISegmentedControl.init()
        segment.frame = CGRectMake(0, 0, self.view.width, segmentHeight)
        return segment
    }()
    
    lazy var  scrollView:UIScrollView = {
        let scrollView:UIScrollView = UIScrollView.init()
        scrollView.frame = CGRectMake(0, segmentHeight, self.view.width, self.view.height - segmentHeight)
        return scrollView
    }()
    override func viewDidLoad() {
        self.edgesForExtendedLayout = UIRectEdge.None
        view.backgroundColor = UIColor.whiteColor()
        setCenterTitle("V2ex")
        view.addSubview(segment)
        view.addSubview(scrollView)
        segment.addTarget(self, action: #selector(clickButton), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func refreshWithNodes(nodes:[Node]) -> Void {
        segment.removeAllSegments()
        
        for a in 0 ..< nodes.count  {
            let node:Node = nodes[a]
            segment.insertSegmentWithTitle(node.name, atIndex: a, animated: false)
        }
        scrollView.contentSize = CGSizeMake(scrollView.width * CGFloat(nodes.count), scrollView.height)
        
        
    }
    
    
    
    /**
     拉取数据正常
     */
    func getAllPointSuccess(returnData: AnyObject, dataType: APIDataType) {
        var nodeArray = Array<Node>()
        var nodeTitleArray = Array<String>()
        if let data = returnData  as? [Dictionary<String,AnyObject>] {
            for  item  in data {
                let  node  =  Mapper<Node>().map(item)
                if let anode = node {
                    if let title = anode.title {
                        nodeArray.append(anode)
                        nodeTitleArray.append(title)
                    }
                    
                }
            }
        }
        var subNodes =  Array<Node>()
        for  index  in 0 ..< nodeArray.count {
            let node:Node = nodeArray[index]
            if let title = node.title {
                switch title {
                case "iDev":
                    subNodes.append(node)
                case "酷工作":
                    subNodes.append(node)
                default:
                    break
                }
            }
            
        }
        
        refreshWithNodes(subNodes)
        
    }
    
    func getAllPointFailure(error: NSError) {
        
    }
    
    func clickButton() -> Void {
        self.request.startRequest()
    }
}