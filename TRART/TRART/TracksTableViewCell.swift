//
//  TracksTableViewCell.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/11/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class TracksTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func auditionButtonAction(sender: AnyObject) {
        //NSNotificationのインスタンスを作成。["value":100]という辞書型のデータを持たせる
        var notification : NSNotification = NSNotification(name: "audition", object: self, userInfo: ["value": 100])
        //通知を送る
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
    
}
