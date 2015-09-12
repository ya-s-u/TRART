//
//  MakeNewNavigationController.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/11/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class MakeNewNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initなどでNSNotification登録
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showMiniPlayer", name: "audition", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showMiniPlayer() {
        let miniPlayer: UIView = UINib(nibName: "MiniPlayer", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! UIView
        miniPlayer.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 40.0)
        miniPlayer.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height - 20.0)
        miniPlayer.alpha = 0
        
        self.view.addSubview(miniPlayer)
        
        UIView.animateWithDuration(0.5, animations: {
            miniPlayer.alpha = 1
        })
    }
    
}
