import UIKit

extension UIColor {
    class func keyColor() -> UIColor {
        return UIColor.rgbColor(0x00ACED)
    }
    
    class func backgroundColor() -> UIColor {
        return UIColor.rgbColor(0x305097)
    }
    
    class func textColor() -> UIColor {
        return UIColor.rgbColor(0xffffff)
    }
    
    class func auditionTextColor() -> UIColor {
        return UIColor.rgbColor(0xCCAA74)
    }
    
    class func addedTextColor() -> UIColor {
        return UIColor.rgbColor(0x4B4F5A)
    }
    
    class func makeNewTabColorActive() -> UIColor {
        return UIColor.rgbColor(0x10161a)
    }
    
    class func makeNewTabColorNonActive() -> UIColor {
        return UIColor.rgbColor(0x3a4758)
    }
    
    class func buttonColor() -> UIColor {
        return UIColor.redColor()
    }
    
    class func rgbColor(rgbValue: UInt) -> UIColor {
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >>  8) / 255.0,
            blue:  CGFloat( rgbValue & 0x0000FF)        / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
