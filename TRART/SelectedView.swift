import UIKit

class SelectedView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let playlistPlayer = PlaylistPlayerManager.sharedInstance
    var lastPath: NSIndexPath!
    
    override func awakeFromNib() {
        // receive notification
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "updatePlayingTracks:",
            name: "updatePlayingTracks",
            object: nil
        )
        
        collectionView.registerNib(UINib(nibName: "SelectedTracksCell", bundle: nil), forCellWithReuseIdentifier: "SelectedTracksCell")
        collectionView.backgroundColor = UIColor.textViewColor()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: SelectedTracksCell = collectionView.dequeueReusableCellWithReuseIdentifier("SelectedTracksCell",
            forIndexPath: indexPath) as! SelectedTracksCell
        
        if indexPath.row < playlistPlayer.tracks.count {
            cell.track = playlistPlayer.tracks[indexPath.row]
        } else {
            cell.image.image = UIImage(named: "track\(indexPath.row+1)")
            cell.name.text = "トラック\(indexPath.row+1)"
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row >= playlistPlayer.tracks.count {
            return
        }
        
        if lastPath != nil {
            let lastCell = collectionView.cellForItemAtIndexPath(lastPath) as! SelectedTracksCell
            lastCell.unselect()
        }
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! SelectedTracksCell
        cell.select()
        
        lastPath = indexPath
        
        // set track
        playlistPlayer.currentIndex = indexPath.row
        
        // send notification
        var notification = NSNotification(name: "selectWillPlayTrack", object: nil)
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
    
    func updatePlayingTracks(notification: NSNotification) {
        self.collectionView.reloadData()
    }

}
