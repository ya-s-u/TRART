import UIKit
import RealmSwift
import Haneke

class TracksTableViewController: UITableViewController {
    
    var parentNavigationController : UINavigationController?
    let realm = Realm()
    var tracks: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "TracksTableViewCell", bundle: nil), forCellReuseIdentifier: "TracksTableCellController")
    
        let realmResponse = realm.objects(Track)
//        println("Track Count: \(realmResponse.count)")
        
        for track in realmResponse {
//            println("\(track.name)")
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
        let cell : TracksTableCellController = tableView.dequeueReusableCellWithIdentifier("TracksTableCellController") as! TracksTableCellController
        cell.track = tracks[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 68.0
    }

}
