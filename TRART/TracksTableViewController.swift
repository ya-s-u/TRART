import UIKit
import RealmSwift
import SDWebImage

class TracksTableViewController: UITableViewController {
    
    var del =  UIApplication.sharedApplication().delegate as! AppDelegate
    let playlistPlayer = PlaylistPlayerManager.sharedInstance
    
    var parentNavigationController : UINavigationController?
    let realm = Realm()
    var tracks: [Track] = []
    var saveTracks: [Track] = []
    var checkedTracks: [Int: Track] = [0: Track()]
    var playlist = Playlist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register notification
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "resetCreatingPlaylist:",
            name: "resetCreatingPlaylist",
            object: nil
        )
        
        self.tableView.registerNib(UINib(nibName: "TracksTableViewCell", bundle: nil), forCellReuseIdentifier: "TracksTableCellController")
        
        self.loadPlaylistData()
        
        self.checkedTracks.removeAll()
        //Receive Nortification from MakeNewController.swift
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "savePlaylist", name: "makePlaylist", object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //---------------------------
    //# MARK: - LoadDataMethod
    //---------------------------
    func loadPlaylistData(){
        tracks.removeAll()
        
        let realmResponse = realm.objects(Track)
        for track in realmResponse {
            tracks.append(track)
        }
        tracks.shuffle(tracks.count)
        
        self.tableView.reloadData()
    }
    
    func savePlaylist(){
        for track in checkedTracks{
            saveTracks.append(track.1)
        }
        del.playlist.setTracksArr(saveTracks)
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
        let cell : TracksTableCellController = tableView.dequeueReusableCellWithIdentifier("TracksTableCellController") as! TracksTableCellController
        cell.track = tracks[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 68.0
    }
    
    override func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
        let cell : TracksTableCellController = tableView.cellForRowAtIndexPath(indexPath) as! TracksTableCellController
        
        if self.checkedTracks.count == 8 {
            if cell.isChecked{
                cell.plusButton.image = UIImage(named: "plus-button")
                self.checkedTracks.removeValueForKey(self.tracks[indexPath.row].itunesId)
                cell.isChecked = !cell.isChecked
                
                //Send a Nortification to MakeNewController.swift
                var notification : NSNotification = NSNotification(name: "8TracksUnSelected", object: nil)
                NSNotificationCenter.defaultCenter().postNotification(notification)
            }
            cell.animation()
            updatePlayingTracks()
            return
        }
        
        if self.checkedTracks.count < 8 {
            if cell.isChecked{
                cell.plusButton.image = UIImage(named: "plus-button")
                self.checkedTracks.removeValueForKey(self.tracks[indexPath.row].itunesId)
            } else {
                cell.plusButton.image = UIImage(named: "plus-button-checked")
                self.checkedTracks[self.tracks[indexPath.row].itunesId] = self.tracks[indexPath.row]
            }
            cell.isChecked = !cell.isChecked
            cell.animation()
        }
        
        if self.checkedTracks.count == 8 {
            //Send a Nortification to MakeNewController.swift
            var notification : NSNotification = NSNotification(name: "8TracksSelected", object: nil)
            NSNotificationCenter.defaultCenter().postNotification(notification)
        }
        
        updatePlayingTracks()
    }
    
    func updatePlayingTracks() {
        if checkedTracks.count > 7 {
            return
        }
        
        playlistPlayer.tracks.removeAll()
        
        for track in checkedTracks{
            playlistPlayer.tracks.append(track.1)
        }
        
        // send notification
        var notification = NSNotification(name: "updatePlayingTracks", object: nil)
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
    
    func resetCreatingPlaylist(sender: AnyObject) {
        checkedTracks.removeAll()
        playlistPlayer.tracks.removeAll()
    }
    
}
