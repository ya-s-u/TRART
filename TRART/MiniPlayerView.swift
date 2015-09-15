import UIKit

class MiniPlayerView: UIView {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var seekBar: UISlider!
    
    var track: Track? {
        didSet {
            let player = PlayerManager.sharedInstance
            player.set(track!.trackSource as String)
            player.play()
        }
    }
    
    func changePlayButtonToStop() {
        self.playButton.setTitle("◼︎", forState: UIControlState.Normal)
    }
    
    func changeStopButtonToPlay() {
        self.playButton.setTitle("▶︎", forState: UIControlState.Normal)
    }
}
