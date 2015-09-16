import UIKit
import Spring

class TracksTableCellController: UITableViewCell {
    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var plusButton: SpringImageView!
    
    var isChecked: Bool = false
    
    let player = PlayerManager.sharedInstance
    
    var track: Track? {
        didSet {
            trackName.text = self.track!.name
            artist.text = self.track!.artist
            
            var url = NSURL(string: self.track!.cover as String!)
            cover.sd_setImageWithURL(url!)
        }
    }
    
    func animation() {
        plusButton.animation = "pop"
        plusButton.duration = 0.5
        plusButton.animate()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        trackName.font = UIFont.boldSystemFontOfSize(14)
        trackName.textColor = UIColor.whiteColor()
        
        artist.font = UIFont.systemFontOfSize(11)
        artist.textColor = UIColor.whiteColor()
    }
    
    @IBAction func tapCover(sender: AnyObject) {
        if player.isPlaying() {
            player.stop()
        } else {
            player.track = track
            player.play()
        }
    }
    
}
