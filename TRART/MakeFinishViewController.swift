import UIKit

class MakeFinishViewController: UIViewController {
    
    var del:AppDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet var pTitle: UILabel!
    @IBOutlet var pSummary: UILabel!
    @IBOutlet var TitleView: UIView!
    @IBOutlet var CommentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pTitle.text = del.playlist.title
        pSummary.text = del.playlist.comment
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        //グラデーションの開始色
        let topColor = UIColorFromRGB(0x000000, aValue: 0)
        //グラデーションの終了色
        let bottomColor = UIColorFromRGB(0x000000, aValue: 1.0)
        
        //グラデーションの色を配列で管理
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        
        //グラデーションレイヤーを作成
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        //グラデーションの色をレイヤーに割り当てる
        gradientLayer.colors = gradientColors
        //グラデーションレイヤーをスクリーンサイズにする
        gradientLayer.frame = self.TitleView.bounds
    
        //グラデーションレイヤーをビューの一番下に配置
        self.TitleView.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        self.CommentView.backgroundColor = UIColorFromRGB(0x282828, aValue: 1.0)
        
        let myBarButton_Done = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "onDoneButton:")
        self.navigationController?.navigationBar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem
        self.navigationItem.setRightBarButtonItem(myBarButton_Done, animated: true)

    }
    
    internal func onDoneButton(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func UIColorFromRGB(rgbValue: UInt ,aValue: CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(aValue)
        )
    }
    
}
