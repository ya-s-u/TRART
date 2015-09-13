import UIKit

class TracksTableView: UITableView {
    override func awakeFromNib() {
        let topColor = UIColor.rgbColor(0x030302)
        let bottomColor = UIColor.rgbColor(0x1a2c45)
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
}
