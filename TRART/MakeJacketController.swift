import UIKit
import SDWebImage

class MakeJacketViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate{
    

    var del:AppDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
    var frame:UIImage = UIImage(named: "frame")!
    var highlight:UIImage = UIImage(named: "highlight")!
    var selectimg:UIImage = UIImage(named: "selectFrame")!
    var setNum:Int = 0
    var cell:CustomCell!
    var lay:LayerCell!
    var cancel:Bool = false
    var page:UInt32 = 0
    var layout_type:Int = 0
    var temp:[Int] = []
    var jaket:[[Int]] = Array(count: 8, repeatedValue: [])
    let jcnt:[Int] = [3,5,6]
    var selectFlag:[[Bool]] = Array(count: 8, repeatedValue: Array(count: 8, repeatedValue: false))
    var layoutView:UICollectionView!
    var selectView:UICollectionView!
    var scrollFlag:Bool = false
    var autoselect:[Int] = [0,1,0]
    var rastarize:[Int] = [0,4,0]
    var sendJacket:[Track] = []
    let MyNotification = "MyNotification"
    var myBarButton_Done:UIBarButtonItem!
    var myBarButton_Cancel:UIBarButtonItem!
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var lview: UICollectionView!
    @IBOutlet var sview: UICollectionView!
    
    
//    var playlist: Playlist?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "ラベルを編集"

        myBarButton_Done = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "onDoneButton:")
        myBarButton_Cancel = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "onCancelButton:")
        
        self.navigationController?.navigationBar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem
        self.navigationItem.setRightBarButtonItem(myBarButton_Done, animated: true)
        self.navigationItem.setLeftBarButtonItem(myBarButton_Cancel, animated: true)
        
        pageControl.transform = CGAffineTransformMakeScale(1.5, 1.5)
        pageControl.currentPageIndicatorTintColor = UIColor.auditionTextColor()
        lview.backgroundColor = UIColor.clearColor()
        sview.backgroundColor = UIColor.clearColor()
        enableButton()
    }
    
    func enableButton(){
        if self.jaket[layout_type].count != jcnt[layout_type]{
            myBarButton_Done.enabled = false
        }else{
            myBarButton_Done.enabled = true
        }
        
    }
    
    internal func onDoneButton(sender: UIButton){
        
        for i in 0..<jaket[layout_type].count{
            var track:Track = del.playlist!.tracks[jaket[layout_type][i] - 1]
            sendJacket.append(track)
        }
        
        del.playlist?.setJackets(layout: layout_type, jackets: sendJacket)
        self.dismissViewControllerAnimated(true, completion: nil)
        
        // Post Notification（送信）
        let ns = NSNotificationCenter.defaultCenter()
        ns.postNotificationName(MyNotification, object: nil)
    }
    
    internal func onCancelButton(sender: UIButton){
        del.playlist?.jackets.removeAll()
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        page = (UInt32)(scrollView.contentOffset.x / scrollView.bounds.size.width)
        pageControl.currentPage = Int(page)
        layout_type = Int(page)
        enableButton()
        selectView.reloadData()
        
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0{
            
            layoutView = collectionView
            
            
            var layname:String = "laycell" + String(indexPath.row+1)
            lay = collectionView.dequeueReusableCellWithReuseIdentifier(layname, forIndexPath: indexPath) as! LayerCell
            
            for i in 0..<jaket[indexPath.row].count{
//                var mname:String = "music" + String(jaket[indexPath.row][i])
//                lay.image[i].image = UIImage(named: mname)
                var url = NSURL(string: del.playlist?.tracks[jaket[indexPath.row][i] - 1].cover as String!)
                lay.image[i].sd_setImageWithURL(url!)
                
                if rastarize[indexPath.row] != 0{
                    if i == rastarize[indexPath.row]{
                        lay.image[i].layer.shouldRasterize = true
                        lay.image[i].layer.rasterizationScale = 0.1
                    }
                }
            }
            
            if jaket[indexPath.row].count < jcnt[indexPath.row]{
                for i in jaket[indexPath.row].count..<jcnt[indexPath.row]{
                    if i == jaket[indexPath.row].count{
                        lay.image[i].image = highlight
                    }else{
                        if i == rastarize[indexPath.row]{
                            lay.image[i].image = nil
                        }else{
                            lay.image[i].image = frame
                        }
                    }
                    lay.image[i].tag = 0
                }
            }
            
            lay.backgroundColor = UIColor.blackColor()
            return lay
        }else{
            selectView = collectionView
            
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCell

            //セルの動的なサイズ変更について（余裕があれば）
//            var cellsize:CGFloat = (selectView.bounds.size.width - 51) / 4
//            cell.bounds.size = CGSizeMake(cellsize, cellsize)
            
            var url = NSURL(string: del.playlist?.tracks[indexPath.row].cover as String!)
            cell.image.sd_setImageWithURL(url!)
            
            cell.Stitle.text = del.playlist?.tracks[indexPath.row].name
            
//            var mname:String = "music" + String(indexPath.row + 1)
//            var nmname2 = playlist?.tracks[indexPath.row].cover
            
//            cell.image.image = UIImage(named: mname)
            cell.select.image = selectimg
            if selectFlag[layout_type][indexPath.row] == true{
                cell.select.alpha = 1.0
            }else{
                cell.select.alpha = 0
            }
            
            cell.backgroundColor = UIColor.blackColor()
            return cell
        }
    }

    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if collectionView.tag == 0{
        }else{
            
            if contains(jaket[layout_type], (indexPath.row + 1)) == false && jaket[layout_type].count < jcnt[layout_type]{
                jaket[layout_type].append(indexPath.row + 1)
                if autoselect[layout_type] == 1 && jaket[layout_type].count == rastarize[layout_type]{
                    jaket[layout_type].append(indexPath.row + 1)
                }
                selectFlag[layout_type][indexPath.row] = true
            }else{
                
                if let deleteNum = find(jaket[layout_type], (Int(indexPath.row) + 1)) {
                    jaket[layout_type].removeAtIndex(deleteNum)
                    if autoselect[layout_type] == 1 && jaket[layout_type].count == rastarize[layout_type]{
                        jaket[layout_type].removeAtIndex(rastarize[layout_type]-1)
                    }
                }
                
                selectFlag[layout_type][indexPath.row] = false
            }
            layoutView.reloadData()
//            selectView.reloadData()
            sview.reloadItemsAtIndexPaths([indexPath])
            enableButton()
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if collectionView.tag == 0{
            return 1
        }else{
            return 1
        }
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            return 3
        }else{
            return 8
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
