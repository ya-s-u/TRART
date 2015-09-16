import UIKit

class PlayerView: UIView {
    var app =  UIApplication.sharedApplication().delegate as! AppDelegate
    
    let player = PlayerManager.sharedInstance
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mask: UIView!
    
    override func awakeFromNib() {
        // register notification
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "updatePlayingTracks:",
            name: "updatePlayingTracks",
            object: nil
        )
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        
        timer.font = UIFont.systemFontOfSize(13)
        timer.textColor = UIColor.whiteColor()
        
        let myImage = UIImage(named: "dummy-pulse")!
        let myImageView = UIImageView()
        myImageView.image = myImage
        myImageView.frame = CGRectMake(0, 0, myImage.size.width, self.bounds.height)
        scrollView.addSubview(myImageView)
        
        let myImage2 = UIImage(named: "dummy-pulse")!
        let myImageView2 = UIImageView()
        myImageView2.image = myImage2
        myImageView2.frame = CGRectMake(myImage.size.width, 0, myImage2.size.width, self.bounds.height)
        scrollView.addSubview(myImageView2)
        
        scrollView.contentSize = CGSizeMake(1200, self.bounds.height)
        
        mask.backgroundColor = UIColor(white: 0, alpha: 0.5)
        mask.userInteractionEnabled = false
        
        let separator = UIView()
        separator.frame = CGRectMake(UIScreen.mainScreen().bounds.size.width/2, 0, 1, self.bounds.height)
        separator.backgroundColor = UIColor.auditionTextColor()
        self.addSubview(separator)
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
    
    func updatePlayingTracks(notification: NSNotification) {
        println(app.playingTracks)
    }
    
    func updateTimer() {
        if player.isPlaying() {
            timer.text = player.currentTimeStr()
            scrollView.contentOffset.x = scrollView.contentOffset.x+1
        }
    }
}
