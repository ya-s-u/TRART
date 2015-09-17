//
//  MainController.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/14/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import RealmSwift
import SASecretCommandViewController

class MainController: SASecretCommandViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var homeNavigationBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var homeNavigationItem: UINavigationItem!
    
    let realm = Realm()
    var playlists: [Playlist] = []
    var gradationType: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navbar
        self.homeNavigationBar.alpha = 0
        
        let homeNavCreate:UIBarButtonItem!
        homeNavCreate = UIBarButtonItem(title: "", style: .Plain, target: self, action: "segueToMakeNew")
        homeNavCreate.image = UIImage(named: "homeNavCreate")
        homeNavCreate.tintColor = UIColor.whiteColor()
        
        let imageViewTmp = UIImageView(image: UIImage(named: "homeNavTitle"))
        imageViewTmp.frame = CGRectMake(0, 0, 85, 30)

        self.homeNavigationItem.titleView = imageViewTmp
        self.homeNavigationItem.setRightBarButtonItem(homeNavCreate, animated: true)
        
        //TableViewHeader
        let header: MainTableHeaderController = UINib(nibName: "MainTableHeader", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! MainTableHeaderController
        self.tableView.tableHeaderView = header
        
        //Nortification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "segueToMakeNew", name: "CreateButton", object: nil)
        
        //tableView Delegate
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // set secret command
        let commandList: [SASecretCommandType] = [
            .Left,
            .Right,
            .Left,
            .Right,
            .Left,
            .Right,
            .A,
            .B
        ]
        self.registerSecretCommand(commandList)
    }
    
    override func secretCommandPassed() {
        super.secretCommandPassed()
        
        // clean realm data
        realm.write {
            self.realm.deleteAll()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadPlaylistData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadPlaylistData(){
        playlists.removeAll()
        
        var playlistTmp: [Playlist] = []
        let realmResponse = realm.objects(Playlist)
        for playlist in realmResponse {
            playlistTmp.append(playlist)
        }
        self.playlists = playlistTmp.reverse()
                
        self.tableView.reloadData()
    }
    
    //---------------------------
    //# MARK: - TableViewMethod
    //---------------------------
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playlists.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 290.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeTableViewCell") as! HomeTableViewCell
        
        cell.loadTemplate(playlists[indexPath.row])
        cell.titleLabel.text = playlists[indexPath.row].title
        cell.commentLabel.text = playlists[indexPath.row].comment
        
        return cell
    }
    
    //選択したCellをdetailViewControllerにデータを渡す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "homeDetail") {
            let detailViewContoroller = segue.destinationViewController as! HomeDetailViewController
            var ip: NSIndexPath! = self.tableView.indexPathForSelectedRow()
            detailViewContoroller.param = self.playlists[ip.row]
        }else{
            println("nothing to do")
        }
    }
    
    //---------------------------
    //# MARK: - ScrollViewMethod
    //---------------------------
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        changeNavbarAlpha(scrollView.contentOffset.y)
        changeHomeBackgroundImage(scrollView.contentOffset.y)
        changePlaylistBackgroundAlpha(scrollView.contentOffset.y)
    }
    
    func changeNavbarAlpha(offsetY: CGFloat) {
        if offsetY < 0 {
            self.homeNavigationBar.alpha = 0
            return
        }
        self.homeNavigationBar.alpha = offsetY / 320
    }
    
    func changePlaylistBackgroundAlpha(offsetY: CGFloat) {
        if offsetY > 320 && offsetY < 1040 {
            self.tableView.backgroundView?.alpha = (offsetY - 320) / 720
            return
        }
    }
    
    func changeHomeBackgroundImage(offsetY: CGFloat) {
        if offsetY >= 320 {
            self.tableView.backgroundView = UIImageView(image: UIImage(named: "Home-back-playlist1"))
            return
        }
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "Home-backimg"))
    }
    
    func changeHomeBackgroudImgGradationColor(offsetY: CGFloat) {
        if (offsetY%320) >= 0.0 && (offsetY%320) <= 50.0 {
            if self.gradationType == 0{
                self.gradationType == 1
                self.tableView.backgroundView = UIImageView(image: UIImage(named: "Home-back-playlist1"))
            }
            else if self.gradationType == 1{
                self.gradationType == 2
                self.tableView.backgroundView = UIImageView(image: UIImage(named: "Home-back-playlist2"))
            }
            else if self.gradationType == 2{
                self.gradationType == 0
                self.tableView.backgroundView = UIImageView(image: UIImage(named: "Home-back-playlist3"))
            }
        }
    }
    
    //---------------------------
    //# MARK: - Segue
    //---------------------------
    
    func segueToMakeNew() {
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var makeNewViewController = storyboard.instantiateViewControllerWithIdentifier("MakeNew") as! UIViewController
        self.presentViewController(makeNewViewController, animated: true, completion: nil)
    }
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
    }
}
