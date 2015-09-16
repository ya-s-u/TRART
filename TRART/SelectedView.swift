import UIKit

class SelectedView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let playlistPlayer = PlaylistPlayerManager.sharedInstance
    
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
        println("Num: \(indexPath.row)")
        let cell: SelectedTracksCell = collectionView.dequeueReusableCellWithReuseIdentifier("SelectedTracksCell",
            forIndexPath: indexPath) as! SelectedTracksCell
//        cell.select()
        
        cell.image.layer.borderColor = UIColor.auditionTextColor().CGColor
        cell.image.layer.borderWidth = 2
    }
    
    func updatePlayingTracks(notification: NSNotification) {
        self.collectionView.reloadData()
    }

}
