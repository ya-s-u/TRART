import UIKit

class MakeNewNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showMiniPlayer", name: "audition", object: nil)
    }
    
    func showMiniPlayer() {
        let miniPlayer: MiniPlayerView = UINib(nibName: "MiniPlayer", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! MiniPlayerView
        miniPlayer.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 40.0)
        miniPlayer.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height - 20.0)
        miniPlayer.alpha = 0
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        miniPlayer.track = app.track
        
        self.view.addSubview(miniPlayer)
        
        UIView.animateWithDuration(0.5, animations: {
            miniPlayer.alpha = 1
        })
        
    }
    
}
