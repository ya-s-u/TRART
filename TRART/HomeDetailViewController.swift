//
//  HomeDetailViewController.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/17/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class HomeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var nav: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navitem: UINavigationItem!
    
    var param: Playlist!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorColor = UIColor.rgbColor(0x404040)
        self.tableView.layoutMargins = UIEdgeInsetsZero
        
        let homeNavCreate:UIBarButtonItem!
        homeNavCreate = UIBarButtonItem(title: "戻る", style: .Plain, target: self, action: "backButtonAction")
        homeNavCreate.tintColor = UIColor.whiteColor()
        self.navitem.setLeftBarButtonItem(homeNavCreate, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //---------------------------
    //# MARK: - TableViewMethod
    //---------------------------
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.param.tracks.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 68.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ConfirmationTableViewCell") as! ConfirmationTableViewCell
        
        cell.track = self.param.tracks[indexPath.row]
        
        return cell
    }
    
    func backButtonAction() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
