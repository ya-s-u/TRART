import UIKit
import SDWebImage

class SelectedTracksCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var track: Track? {
        didSet {
            var url = NSURL(string: self.track?.cover as String!)
            image.sd_setImageWithURL(url!)
            
            name.text = track?.name as String!
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        name.font = UIFont.systemFontOfSize(9)
        name.textColor = UIColor.whiteColor()
    }
    
    func select() {
        image.layer.borderColor = UIColor.auditionTextColor().CGColor
        image.layer.borderWidth = 2
    }
    
    func diselect() {
        image.layer.borderWidth = 0
    }
}