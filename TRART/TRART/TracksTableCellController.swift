//
//  TracksTableViewCell.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/11/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class TracksTableCellController: UITableViewCell {
    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var cover: UIImageView!
    var trackSource: String = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        trackName.font = UIFont.boldSystemFontOfSize(14)
        trackName.textColor = UIColor.whiteColor()
        
        artist.font = UIFont.systemFontOfSize(11)
        artist.textColor = UIColor.whiteColor()
        
        var tap = UITapGestureRecognizer(target: self, action: Selector("showMailer"))
        trackName.addGestureRecognizer(tap)
        trackName.userInteractionEnabled = true
    }
    
    @IBAction func tapCover(sender: AnyObject) {
        var notification : NSNotification = NSNotification(name: "audition", object: self, userInfo: ["value": 100])
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }

//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
}
