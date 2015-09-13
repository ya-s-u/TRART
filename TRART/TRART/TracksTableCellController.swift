import UIKit

class TracksTableCellController: UITableViewCell {
    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var cover: UIImageView!
    
    var track: Track? {
        didSet {
            trackName.text = self.track!.name
            artist.text = self.track!.artist
            
            var url = NSURL(string: self.track!.cover as String!)
            cover.hnk_setImageFromURL(url!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        trackName.font = UIFont.boldSystemFontOfSize(14)
        trackName.textColor = UIColor.whiteColor()
        
        artist.font = UIFont.systemFontOfSize(11)
        artist.textColor = UIColor.whiteColor()
        
        var tap = UITapGestureRecognizer(target: self, action: Selector("showMailer"))
        trackName.addGestureRecognizer(tap)
        trackName.userInteractionEnabled = true
    }
    
    @IBAction func tapCover(sender: AnyObject) {
        var notification : NSNotification = NSNotification(name: "audition", object: self, userInfo: ["value": 100])
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
}
