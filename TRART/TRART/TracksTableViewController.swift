//
//  TracksTableViewController.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/11/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import RealmSwift
import Haneke

class TracksTableViewController: UITableViewController {
    
    var parentNavigationController : UINavigationController?
    let realm = Realm()
    var tracks: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "TracksTableViewCell", bundle: nil), forCellReuseIdentifier: "TracksTableViewCell")
    
        let realmResponse = realm.objects(Track)
        println("Track Count: \(realmResponse.count)")
        
        for track in realmResponse {
            println("\(track.name)")
            tracks.append(track)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return tracks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : TracksTableViewCell = tableView.dequeueReusableCellWithIdentifier("TracksTableViewCell") as! TracksTableViewCell
        let track = tracks[indexPath.row]
        let URL = NSURL(string: track.cover)
        
        cell.trackName.text = track.name
        cell.artist.text = track.artist
        cell.cover.hnk_setImageFromURL(URL!)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 68.0
    }

}
