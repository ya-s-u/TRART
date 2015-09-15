import UIKit

class PlayerView: UIView {
    let player = PlayerManager.sharedInstance
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var timer: UILabel!
    
    override func awakeFromNib() {
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        
        timer.font = UIFont.systemFontOfSize(13)
        timer.textColor = UIColor.whiteColor()
    }
    
    @IBAction func tapButton(sender: AnyObject) {
        println(player.track?.name)
        
        if player.isPlaying() {
            player.stop()
        } else {
            player.play()
        }
    }
    
    func updateTimer() {
        if player.isPlaying() {
            println(player.currentTime())
            timer.text = player.currentTimeStr()
        }
    }
}
