//
//  MainTableHeaderController.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/13/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class MainTableHeaderController: UIView {

    @IBAction func CreateButtonAction(sender: AnyObject) {
        var notification : NSNotification = NSNotification(name: "CreateButton", object: self, userInfo: ["value": 200])
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
}
