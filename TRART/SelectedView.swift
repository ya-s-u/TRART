import UIKit

class SelectedView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
//    var app =  UIApplication.sharedApplication().delegate as! AppDelegate
    let playlistPlayer = PlaylistPlayerManager.sharedInstance
    
    override func awakeFromNib() {
        // receive notification
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "updatePlayingTracks:",
            name: "updatePlayingTracks",
            object: nil
        )
        
        collectionView.registerClass(SelectedTracksCell.self, forCellWithReuseIdentifier: "SelectedTracksCell")
        collectionView.backgroundColor = UIColor.textViewColor()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlistPlayer.tracks.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: SelectedTracksCell = collectionView.dequeueReusableCellWithReuseIdentifier("SelectedTracksCell",
            forIndexPath: indexPath) as! SelectedTracksCell
        cell.track = playlistPlayer.tracks[indexPath.row]
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Num: \(indexPath.row)")
    }
    
    func updatePlayingTracks(notification: NSNotification) {
        self.collectionView.reloadData()
    }

}
