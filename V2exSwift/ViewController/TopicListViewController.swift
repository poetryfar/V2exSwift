//
//  TopicListViewController.swift
//  V2exSwift
//
//  Created by pengbi on 16/8/25.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation
class TopicListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private let topicName:String
    private var topicId:Int64{
        set{
            self.topicManager.topicId = newValue
        }
        get{
            return self.topicId
        }
    }
    var  topicList:Array = [Node]()
    var  topicHeightList:Array = [Float]()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView.init()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private let  topicManager:TopicListAPIManager = TopicListAPIManager()
    
    init(topicName_:String,topicId_:Int64){
        topicName = topicName_
        super.init(nibName: nil, bundle: nil)
        self.topicId = topicId_;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(topicHeightList[indexPath.row]);
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return nil
    }
}