import UIKit

class MakeJacketViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate{
    
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
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var lview: UICollectionView!
    @IBOutlet var sview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.transform = CGAffineTransformMakeScale(1.5, 1.5)
        pageControl.currentPageIndicatorTintColor = UIColor.auditionTextColor()
        lview.backgroundColor = UIColor.clearColor()
        sview.backgroundColor = UIColor.clearColor()
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        page = (UInt32)(scrollView.contentOffset.x / scrollView.bounds.size.width)
        pageControl.currentPage = Int(page)
        layout_type = Int(page)
        
        
        selectView.reloadData()
        
        //        setNum = jaket[layout_type].count
        //        for i in 0..<jaket[layout_type].count{
        //            var mname:String = "music" + String(jaket[layout_type][i]) + ".jpg"
        //            lay.image[i].image = UIImage(named: mname)
        //        }
        
        print(page)
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0{
            
            layoutView = collectionView
            
            
            var layname:String = "laycell" + String(indexPath.row+1)
            lay = collectionView.dequeueReusableCellWithReuseIdentifier(layname, forIndexPath: indexPath) as! LayerCell
            
            for i in 0..<jaket[indexPath.row].count{
                var mname:String = "music" + String(jaket[indexPath.row][i])
                lay.image[i].image = UIImage(named: mname)
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
            
            var mname:String = "music" + String(indexPath.row + 1)
            
            cell.image.image = UIImage(named: mname)
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
            
            var mname:String = "music" + String(indexPath.row + 1)
            
            
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
            selectView.reloadData()
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
