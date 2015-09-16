import UIKit
import RealmSwift

class MakeConfirmViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate, UITableViewDelegate {

    @IBOutlet var PlaylistTitle: UITextField!
    @IBOutlet var PlayListComment: UIPlaceHolderTextView!
    @IBOutlet weak var tableView: UITableView!
    
    var del:AppDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
    var myBarButton_1:UIBarButtonItem!
    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "プレイリストを編集"
        
        //tableView Delegate
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorColor = UIColor.rgbColor(0x404040)
        self.tableView.layoutMargins = UIEdgeInsetsZero
        self.tableView.editing = true
        
        //Nortification
        
        PlaylistTitle.delegate = self
        PlaylistTitle.backgroundColor = UIColor.textViewColor()
        PlaylistTitle.attributedPlaceholder = NSAttributedString(string:"タイトル(必須)",attributes:[NSForegroundColorAttributeName: UIColor.placeHolderColor()])
        
        PlayListComment.layer.cornerRadius = 4
        PlayListComment.backgroundColor = UIColor.textViewColor()
        PlayListComment.placeHolderColor = UIColor.placeHolderColor()
        PlayListComment.placeHolderLabel.text = "プレイリストの説明"

        myBarButton_1 = UIBarButtonItem(title: "公開", style:.Plain, target: self, action: "onClickMyBarButton:")
        
        //---------------------------
        //# TODO: - 戻るボタンのデザイン(今はできない:9/16 12:00)
        //---------------------------
        //戻るボタンの編集(今はできない:9/16 12:00)
//        let backButton = UIBarButtonItem(title: "キャンセル", style: .Plain, target: self, action: "popViewControllerAnimated:")
//        
//        self.navigationItem.backBarButtonItem = backButton
        
        self.navigationController?.navigationBar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem
        self.navigationItem.setRightBarButtonItem(myBarButton_1, animated: true)
        
        self.enableButton()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        let viewControllers = self.navigationController?.viewControllers!
        if indexOfArray(viewControllers!, searchObject: self) == nil{
            del.playlist.jackets.removeAll()
            
            // show player
            var notification = NSNotification(name: "showPlaylistPlayer", object: nil)
            NSNotificationCenter.defaultCenter().postNotification(notification)
        }
        super.viewWillDisappear(animated)
    }
    
    internal func onClickMyBarButton(sender: UIButton){

        del.playlist.setMeta(title: PlaylistTitle.text, userName: "GUEST", comment: PlayListComment.text, mood: "HAPPY")
        
        let realm = Realm()
        realm.write{
            realm.add(self.del.playlist)
        }
        
        self.performSegueWithIdentifier("confirm2finish", sender: nil)
    }
    
    func indexOfArray(array:[AnyObject], searchObject: AnyObject)-> Int? {
        for (index, value) in enumerate(array) {
            if value as! UIViewController == searchObject as! UIViewController {
                return index
            }
        }
        return nil
    }
    
    func enableButton(){
        if PlaylistTitle.text.isEmpty == false{
            myBarButton_1.enabled = true
        }else{
            myBarButton_1.enabled = false
        }
    }
    
    //---------------------------
    //# MARK: - TableViewMethod
    //---------------------------
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.del.playlist.tracks.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 68.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ConfirmationTableViewCell") as! ConfirmationTableViewCell
        
        cell.track = self.del.playlist.tracks[indexPath.row]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        var itemToMove = self.del.playlist.tracks[sourceIndexPath.row]
        self.del.playlist.tracks.removeAtIndex(sourceIndexPath.row)
        self.del.playlist.tracks.insert(itemToMove, atIndex: destinationIndexPath.row)
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }
    
    func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    //---------------------------
    //# MARK: - IBAction
    //---------------------------
    
    @IBAction func tapScreen(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBAction func didChange(sender: AnyObject) {
        enableButton()
    }
    @IBAction func endEdit(sender: AnyObject) {
        enableButton()
    }
    
    @IBAction func selectJacket(sender: AnyObject) {
    }
    
    //---------------------------
    //# MARK: - Keyboard
    //---------------------------
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        PlaylistTitle.resignFirstResponder()
        PlayListComment.resignFirstResponder()
    }
    
}
