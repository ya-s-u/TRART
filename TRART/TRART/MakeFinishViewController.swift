import UIKit

class MakeFinishViewController: UIViewController {
    
    var del:AppDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet var pTitle: UILabel!
    @IBOutlet var pSummary: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pTitle.text = del.playlist.title
        pSummary.text = del.playlist.comment
    }
    
}
