import UIKit

class MakeNewNavigationController: UINavigationController {
    var selectedTracks: SelectedView!
    var player: PlayerView!
    let playlistPlayer = PlaylistPlayerManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register notification
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "showPlaylistPlayer:",
            name: "showPlaylistPlayer",
            object: nil
        )
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "hidePlaylistPlayer:",
            name: "hidePlaylistPlayer",
            object: nil
        )
        
        var notification = NSNotification(name: "showPlaylistPlayer", object: nil)
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
    
    func showPlaylistPlayer(sender: AnyObject) {
        selectedTracks = UINib(nibName: "Selected", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! SelectedView
        selectedTracks.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 80.0)
        selectedTracks.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height - 110.0)
        self.view.addSubview(selectedTracks)
        
        player = UINib(nibName: "Player", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! PlayerView
        player.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 70.0)
        player.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height - 35.0)
        self.view.addSubview(player)
        println("+1")
        
//        // send notification
//        var notification = NSNotification(name: "updatePlayingTracks", object: nil)
//        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
    
    func hidePlaylistPlayer(sender: AnyObject) {
        selectedTracks.removeFromSuperview()
        player.removeFromSuperview()
        println("-1")
    }
}
