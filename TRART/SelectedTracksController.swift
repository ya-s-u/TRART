import UIKit

class SelectedTracksController: UICollectionViewController {
    
    var app =  UIApplication.sharedApplication().delegate as! AppDelegate
    let playlistPlayer = PlaylistPlayerManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.registerNib(UINib(nibName: "SelectedTracksCell", bundle: nil), forCellWithReuseIdentifier: "SelectedTracksCell")
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("SelectedTracksCell",
            forIndexPath: indexPath) as! SelectedTracksCellController
        
        cell.backgroundColor = UIColor.orangeColor()
        return cell
    }
}
