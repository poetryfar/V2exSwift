//
//  TopicCell.swift
//  V2exSwift
//
//  Created by pengbi on 16/8/25.
//  Copyright © 2016年 pengbi. All rights reserved.
//

import Foundation
class ReplyView: UIView {
    var  bgImageView:UIImageView
    var  replyLabel:UILabel
    override init(frame: CGRect) {
        bgImageView = UIImageView.init(image: UIImage.init(named: ""))
        replyLabel = UILabel.createLabel(.Center, backgroundColor:UIColor.clearColor(), text: "", font: UIFont.systemFontOfSize(12), textColor: UIColor.blackColor())
        super.init(frame: frame)

    }
    
    func setReplayNumber(number:Int) {
        replyLabel.text = String(number)
        replyLabel.sizeToFit()
        let right = self.right
        self.width = replyLabel.width + 20
        replyLabel.centerX  = self.width / 2
        self.right = right
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class TopicCell: UITableViewCell {
    
    var avatar:UIImageView
    var titleLabel:UILabel
    var replyView:ReplyView
    var createTimeLabel:UILabel
    
    var nameLabel:UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel.createLabel(.Center, backgroundColor: UIColor.clearColor(), text: "", font: UIFont.systemFontOfSize(12), textColor: UIColor.blackColor())
        nameLabel = UILabel.createLabel(.Center, backgroundColor: UIColor.clearColor(), text: "", font: UIFont.systemFontOfSize(12), textColor: UIColor.blackColor())
        avatar = UIImageView.init()
        replyView = ReplyView.init(frame:CGRectMake(0, 0, 20, 10))
        createTimeLabel = UILabel.createLabel(.Center, backgroundColor: UIColor.clearColor(), text: "", font: UIFont.systemFontOfSize(12), textColor: UIColor.blackColor())
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(avatar)
        avatar.frame = CGRectMake(0, 4, 20, 20)
        
        
        
        self.contentView.addSubview(nameLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}