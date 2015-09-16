import UIKit
import RealmSwift

class MakeConfirmViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var PlaylistTitle: UITextField!
    @IBOutlet var PlayListComment: UIPlaceHolderTextView!
    var del:AppDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
    var myBarButton_1:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlaylistTitle.delegate = self
        PlaylistTitle.backgroundColor = UIColor.textViewColor()
        PlaylistTitle.attributedPlaceholder = NSAttributedString(string:"タイトル(必須)",
            attributes:[NSForegroundColorAttributeName: UIColor.placeHolderColor()])
        
        PlayListComment.layer.cornerRadius = 4
        PlayListComment.backgroundColor = UIColor.textViewColor()
        PlayListComment.placeHolderColor = UIColor.placeHolderColor()
        PlayListComment.placeHolderLabel.text = "プレイリストの説明"

        // BarButtonItemを作成する.
        
        myBarButton_1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "onClickMyBarButton:")
        
        self.navigationController?.navigationBar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem
        self.navigationItem.setRightBarButtonItem(myBarButton_1, animated: true)
        enableButton()
    }
    
    func enableButton(){
        if PlaylistTitle.text.isEmpty == false{
            myBarButton_1.enabled = true
        }else{
            myBarButton_1.enabled = false
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func didChange(sender: AnyObject) {
        enableButton()
    }
    @IBAction func endEdit(sender: AnyObject) {
        enableButton()
    }
    internal func onClickMyBarButton(sender: UIButton){

        del.playlist.setMeta(title: PlaylistTitle.text, userName: "GUEST", comment: PlayListComment.text, mood: "HAPPY")
        
        let realm = Realm()
        realm.write{
            realm.add(self.del.playlist)
        }
        
        self.performSegueWithIdentifier("confirm2finish", sender: nil)
    }
    
    
    @IBAction func selectJacket(sender: AnyObject) {

    }
    
    override func viewWillDisappear(animated: Bool) {
        
        let viewControllers = self.navigationController?.viewControllers!
        if indexOfArray(viewControllers!, searchObject: self) == nil{
            del.playlist.jackets.removeAll()
            
        }
        super.viewWillDisappear(animated)
    }
    
    func indexOfArray(array:[AnyObject], searchObject: AnyObject)-> Int? {
        for (index, value) in enumerate(array) {
            if value as! UIViewController == searchObject as! UIViewController {
                return index
            }
        }
        return nil
    }
    
    @IBAction func tapScreen(sender: AnyObject) {
        self.view.endEditing(true)
    }
}
