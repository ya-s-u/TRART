import UIKit
import SDWebImage

class SelectedTracksCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var track: Track? {
        didSet {
            println(track?.name as String!)
//            var url = NSURL(string: self.track?.trackSource as String!)
//            image.sd_setImageWithURL(url!)
            
//            name.text = "track name"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}