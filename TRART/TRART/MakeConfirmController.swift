import UIKit
import RealmSwift

class MakeConfirmViewController: UIViewController {
    
    
    var del:AppDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
    let MyNotification = "MyNotification"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func unwindToConfirmation(segue: UIStoryboardSegue) {

        let ns = NSNotificationCenter.defaultCenter()
        ns.postNotificationName(MyNotification, object: nil)
    }
    
    @IBAction func selectJacket(sender: AnyObject) {
        del.playlist.jackets.removeAll()
    }
    
}
