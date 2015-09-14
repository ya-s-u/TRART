import UIKit
import RealmSwift
import Haneke

class TracksTableViewController: UITableViewController {
    
    var parentNavigationController : UINavigationController?
    let realm = Realm()
    var tracks: [Track] = []
    var saveTracks: [Track] = []
    var checkedTracks: [Int: Track] = [0: Track()]
    var playlist = Playlist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "TracksTableViewCell", bundle: nil), forCellReuseIdentifier: "TracksTableCellController")
    
        let realmResponse = realm.objects(Track)
        
        for track in realmResponse {
            tracks.append(track)
        }
        
        self.checkedTracks.removeAll()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "savePlaylist", name: "makePlaylist", object: nil)
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
        let cell : TracksTableCellController = tableView.dequeueReusableCellWithIdentifier("TracksTableCellController") as! TracksTableCellController
        cell.track = tracks[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 68.0
    }
    
    override func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        let cell : TracksTableCellController = tableView.cellForRowAtIndexPath(indexPath) as! TracksTableCellController
        
        if cell.isChecked{
            cell.plusButton.image = UIImage(named: "plus-button")
            self.checkedTracks.removeValueForKey(self.tracks[indexPath.row].itunesId)
        } else {
            cell.plusButton.image = UIImage(named: "plus-button-checked")
            self.checkedTracks[self.tracks[indexPath.row].itunesId] = self.tracks[indexPath.row]
        }
        
        cell.isChecked = !cell.isChecked
        println(self.checkedTracks)
    }
    
    func savePlaylist(){
        for track in checkedTracks{
            saveTracks.append(track.1)
        }
        self.playlist.setTracksArr(saveTracks)
    }

}
