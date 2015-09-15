//
//  MainController.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/14/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import RealmSwift

class MainController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let realm = Realm()
    var playlists: [Playlist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header: MainTableHeaderController = UINib(nibName: "MainTableHeader", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! MainTableHeaderController
        self.tableView.tableHeaderView = header
        
        let realmResponse = realm.objects(Playlist)
        for playlist in realmResponse {
            playlists.append(playlist)
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "segueToMakeNew", name: "CreateButton", object: nil)
        //tableView Delegate
        self.tableView.delegate = self
        self.tableView.dataSource = self
    
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func segueToMakeNew() {
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var makeNewViewController = storyboard.instantiateViewControllerWithIdentifier("MakeNew") as! UIViewController
        self.presentViewController(makeNewViewController, animated: true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playlists.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 330.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeTableViewCell") as! HomeTableViewCell
        
        cell.loadTemplate(playlists[indexPath.row])
        cell.titleLabel.text = playlists[indexPath.row].title
        cell.commentLabel.text = playlists[indexPath.row].comment
        
        return cell
    }
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
    }

}
