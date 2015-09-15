import UIKit

class MakeNewNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPlayer()
    }
    
    func showPlayer() {
        let player = UINib(nibName: "Player", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! PlayerView
        player.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 70.0)
        player.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height - 35.0)
        
        self.view.addSubview(player)
    }
    
}
