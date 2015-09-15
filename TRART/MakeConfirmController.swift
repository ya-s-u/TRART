import UIKit
import RealmSwift

class MakeConfirmViewController: UIViewController {
    
    
    @IBOutlet var PlaylistTitle: UITextField!
    @IBOutlet var PlayListSummary: UITextView!
    var del:AppDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
    let MyNotification = "MyNotification"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(PlayListSummary.text)
        // BarButtonItemを作成する.
        
        let myBarButton_1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "onClickMyBarButton:")
        
        self.navigationController?.navigationBar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem
        self.navigationItem.setRightBarButtonItem(myBarButton_1, animated: true)

    }
    
    internal func onClickMyBarButton(sender: UIButton){
//        let secondViewController = MakeFinishViewController()
//        self.navigationController?.pushViewController(secondViewController, animated: false)

        del.playlist.setMeta(title: PlaylistTitle.text, userName: "GUEST", comment: PlayListSummary.text, mood: "HAPPY")
        self.performSegueWithIdentifier("confirm2finish", sender: nil)
    }
    
    
    @IBAction func unwindToConfirmation(segue: UIStoryboardSegue) {

        let ns = NSNotificationCenter.defaultCenter()
        ns.postNotificationName(MyNotification, object: nil)

    }
    
    @IBAction func selectJacket(sender: AnyObject) {
        del.playlist.jackets.removeAll()
    }
    
}
