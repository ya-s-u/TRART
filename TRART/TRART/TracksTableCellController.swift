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
    }
    
    @IBAction func tapCover(sender: AnyObject) {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        app.track = track
        
        var notification : NSNotification = NSNotification(name: "audition", object: nil)
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
}
