//
//  ArtistTableViewController.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/16/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import RealmSwift

class ArtistsTableViewController: UITableViewController {
    var parentNavigationController : UINavigationController?
    let realm = Realm()
    var tracks: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "ArtistTableViewCell", bundle: nil), forCellReuseIdentifier: "ArtistTableViewCell")
        
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
        let cell : ArtistTableViewCell = tableView.dequeueReusableCellWithIdentifier("ArtistTableViewCell") as! ArtistTableViewCell
        cell.track = tracks[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 68.0
    }
}
