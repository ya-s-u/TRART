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
        removeScrollViewSubViews()
        
        var width = CGFloat(0.0)
        for (i, track) in enumerate(app.playingTracks) {
            let waveform = UIImage(named: "dummy-pulse")!
            let waveformView = UIImageView()
            waveformView.image = waveform
            waveformView.frame = CGRectMake(waveform.size.width * CGFloat(i), 0, waveform.size.width, self.bounds.height)
            scrollView.addSubview(waveformView)
            
            width += waveform.size.width
        }
        
        scrollView.contentSize = CGSizeMake(width, self.bounds.height)
    }
    
    func removeScrollViewSubViews() {
        var subviews = self.scrollView.subviews
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    
    func updateTimer() {
        if player.isPlaying() {
            timer.text = player.currentTimeStr()
            scrollView.contentOffset.x = scrollView.contentOffset.x+1
        }
    }
    
}
