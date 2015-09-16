//
//  AlbumTableViewController.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/16/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import RealmSwift

class AlbumTableViewController: UITableViewController {
    var parentNavigationController : UINavigationController?
    let realm = Realm()
    var tracks: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: "AlbumTableViewCell")
        
        self.loadTrackData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //---------------------------
    //# MARK: - LoadDataMethod
    //---------------------------
    func loadTrackData(){
        tracks.removeAll()
        
        let realmResponse = realm.objects(Track)
        for track in realmResponse {
            tracks.append(track)
        }
        tracks.shuffle(tracks.count)
        
        self.tableView.reloadData()
    }
    
    //---------------------------
    //# MARK: - TableViewMethod
    //---------------------------
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : AlbumTableViewCell = tableView.dequeueReusableCellWithIdentifier("AlbumTableViewCell") as! AlbumTableViewCell
        cell.track = tracks[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 68.0
    }

    
}
