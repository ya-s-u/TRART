import UIKit

class MiniPlayerView: UIView {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var seekBar: UISlider!
    
    var track: Track? {
        didSet {
            println("#####")
            println(track?.trackSource)
        }
    }
    
    func changePlayButtonToStop() {
        self.playButton.setTitle("◼︎", forState: UIControlState.Normal)
    }
    
    func changeStopButtonToPlay() {
        self.playButton.setTitle("▶︎", forState: UIControlState.Normal)
    }
    
    
    
}
