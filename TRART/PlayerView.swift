import UIKit

class PlayerView: UIView {
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        println("open player view")
    }
    
    @IBAction func tapButton(sender: AnyObject) {
        println("tapButton")
    }
}
