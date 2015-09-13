//
//  TracksTableViewCell.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/11/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class TracksTableViewCell: UITableViewCell {

    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var cover: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func auditionButtonAction(sender: AnyObject) {
        var notification : NSNotification = NSNotification(name: "audition", object: self, userInfo: ["value": 100])
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
    
}
