import UIKit

class PlayerView: UIView {
    let player = PlayerManager.sharedInstance
    
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        println("open player view")
    }
    
    @IBAction func tapButton(sender: AnyObject) {
        println(player.track?.name)
    }
}
