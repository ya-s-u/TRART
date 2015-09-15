import UIKit

class PlayerView: UIView {
    let player = PlayerManager.sharedInstance
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mask: UIView!
    
    override func awakeFromNib() {
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        
        timer.font = UIFont.systemFontOfSize(13)
        timer.textColor = UIColor.whiteColor()
        
        let myImage = UIImage(named: "dummy-pulse")!
        let myImageView = UIImageView()
        myImageView.image = myImage
        myImageView.frame = CGRectMake(0, 0, myImage.size.width, 70)
        scrollView.addSubview(myImageView)
        scrollView.contentSize = CGSizeMake(1200, 70)
        
        mask.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }
    
    @IBAction func tapButton(sender: AnyObject) {
        if player.isPlaying() {
            player.stop()
            button.setImage(UIImage(named: "play-button"), forState: UIControlState.Normal)
        } else {
            player.play()
            button.setImage(UIImage(named: "stop-button"), forState: UIControlState.Normal)
        }
    }
    
    func updateTimer() {
        if player.isPlaying() {
            timer.text = player.currentTimeStr()
            scrollView.contentOffset.x = scrollView.contentOffset.x+1
        }
    }
}
