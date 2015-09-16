import UIKit
import Spring

class PlayerView: UIView, UIScrollViewDelegate {
    let app =  UIApplication.sharedApplication().delegate as! AppDelegate
    
    let playlistPlayer = PlaylistPlayerManager.sharedInstance
    
    @IBOutlet weak var button: SpringButton!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var timeSeparator: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mask: UIView!
    
    override func awakeFromNib() {
        // receive notification
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "updatePlayingTracks:",
            name: "updatePlayingTracks",
            object: nil
        )
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "finishPlaylistPlayer:",
            name: "finishPlaylistPlayer",
            object: nil
        )
        
        // interval timer
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        
        timer.font = UIFont.systemFontOfSize(13)
        timer.textColor = UIColor.whiteColor()
        
        timeSeparator.font = UIFont.systemFontOfSize(13)
        timeSeparator.textColor = UIColor.whiteColor()
        
        total.font = UIFont.systemFontOfSize(13)
        total.textColor = UIColor.whiteColor()
        
        scrollView.delegate = self
        
        mask.backgroundColor = UIColor(white: 0, alpha: 0.5)
        mask.userInteractionEnabled = false
        
        let separator = UIView()
        separator.frame = CGRectMake(UIScreen.mainScreen().bounds.size.width/2, 0, 1, self.bounds.height)
        separator.backgroundColor = UIColor.auditionTextColor()
        self.addSubview(separator)
    }
    
    @IBAction func tapButton(sender: AnyObject) {
        if playlistPlayer.playing() {
            // Pause
            button.setImage(UIImage(named: "play-button"), forState: UIControlState.Normal)
            playlistPlayer.pause()
        } else if playlistPlayer.tracks.count > 0 {
            // Replay
            if scrollView.contentOffset.x >= scrollView.contentSize.width-self.bounds.size.width {
                resetScrollViewOffSet()
            }
            
            // Play
            button.setImage(UIImage(named: "stop-button"), forState: UIControlState.Normal)
            playlistPlayer.play()
        }
        
        // animation
        button.animation = "pop"
        button.duration = 0.5
        button.animate()
    }
    
    func updatePlayingTracks(notification: NSNotification) {
        removeScrollViewSubViews()
        
        var width = self.bounds.width
        for (i, track) in enumerate(playlistPlayer.tracks) {
            var waveform: UIImage
            
            switch i%3 {
            case 0 :
                waveform = UIImage(named: "wave1")!
            case 1 :
                waveform = UIImage(named: "wave2")!
            default :
                waveform = UIImage(named: "wave3")!
            }
            
            let waveformView = UIImageView()
            waveformView.image = waveform
            waveformView.frame = CGRectMake(self.bounds.width/2 + waveform.size.width * CGFloat(i), 5, waveform.size.width, self.bounds.height-10)
            scrollView.addSubview(waveformView)
            
            if (i>0 && i<playlistPlayer.tracks.count) {
                let separator = UIView()
                separator.frame = CGRectMake(self.bounds.width/2 + waveform.size.width * CGFloat(i), 0, 1, self.bounds.height)
                separator.backgroundColor = UIColor(white: 1, alpha: 0.5)
                scrollView.addSubview(separator)
            }
            
            width += waveform.size.width
        }
        
        scrollView.contentSize = CGSizeMake(width, self.bounds.height)
        
        total.text = playlistPlayer.totalTimeStr()
    }
    
    func removeScrollViewSubViews() {
        var subviews = self.scrollView.subviews
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    
    func updateTimer() {
        if playlistPlayer.playing() {
            timer.text = playlistPlayer.currentTimeStr()
            if scrollView.contentOffset.x < scrollView.contentSize.width-self.bounds.size.width {
                scrollView.contentOffset.x = scrollView.contentOffset.x+1
            }
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        playlistPlayer.pos(Double(scrollView.contentOffset.x/10))
    }
    
    func resetScrollViewOffSet() {
        scrollView.contentOffset.x = 0
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        scrollView.setContentOffset(scrollView.contentOffset, animated: false)
    }
    
    func finishPlaylistPlayer(notification: NSNotification) {
        button.setImage(UIImage(named: "play-button"), forState: UIControlState.Normal)
    }
}
