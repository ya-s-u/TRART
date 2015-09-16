import UIKit

class SelectedTracksView: UICollectionView {
    let app =  UIApplication.sharedApplication().delegate as! AppDelegate
    
    let playlistPlayer = PlaylistPlayerManager.sharedInstance
    
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.textViewColor()
    }
}
