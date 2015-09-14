//
//  LayoutTableViewController.swift
//  TRART
//
//  Created by itsuki on 2015/09/14.
//  Copyright (c) 2015年 yohei2323. All rights reserved.
//

import UIKit

class LayoutTableViewController: UIViewController {
    
    var del:AppDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
    
    // Define Notification（定義）
    let MyNotification = "MyNotification"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadTemplate()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "myFunc:", name: MyNotification, object: nil)
    }
    
    // Notification Method（通知受信時のメソッド）
    func myFunc(notification: NSNotification?) {
        // Notification 受信時の処理
        self.loadTemplate()
    }


    func loadTemplate(){
        switch(del.playlist.layoutType){
        case 0:
            let Cview = UINib(nibName: "Layer1", bundle: nil).instantiateWithOwner(self, options: nil)[0]
                as! JaketLayer1View
            Cview.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)
            Cview.layer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)
            Cview.playlist = del.playlist
                    self.view.addSubview(Cview)
            break
        case 1:
            let Cview = UINib(nibName: "Layer2", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer2View
            Cview.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)
            Cview.layer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)
            Cview.playlist = del.playlist
                    self.view.addSubview(Cview)
            break
        case 2:
            let Cview = UINib(nibName: "Layer3", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer3View
            Cview.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)
            Cview.layer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)
            Cview.playlist = del.playlist
                    self.view.addSubview(Cview)
            break
        case 3:
            let Cview = UINib(nibName: "Layer4", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer4View
            Cview.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)
            Cview.layer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)
            Cview.playlist = del.playlist
                    self.view.addSubview(Cview)
            break
        case 4:
            let Cview = UINib(nibName: "Layer5", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer5View
            Cview.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)
            Cview.layer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)
            Cview.playlist = del.playlist
                    self.view.addSubview(Cview)
            break
        case 5:
            let Cview = UINib(nibName: "Layer6", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer6View
            Cview.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)
            Cview.layer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)
            Cview.playlist = del.playlist
                    self.view.addSubview(Cview)
            break
        case 6:
            let Cview = UINib(nibName: "Layer7", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer7View
            Cview.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)
            Cview.layer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)
            Cview.playlist = del.playlist
                    self.view.addSubview(Cview)
            break
        case 7:
            let Cview = UINib(nibName: "Layer8", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer8View
            Cview.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)
            Cview.layer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)
            Cview.playlist = del.playlist
                    self.view.addSubview(Cview)
            break
        default:
            let Cview = UINib(nibName: "Layer1", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer1View
            Cview.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)
            Cview.layer.position = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)
            Cview.playlist = del.playlist
                    self.view.addSubview(Cview)
            break
            
        }
        
    }
}
