//
//  HomeTableViewCell.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/15/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var homeCellView: UIView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var commentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let topColor = UIColorFromRGB(0x000000, aValue: 0)
        let bottomColor = UIColorFromRGB(0x000000, aValue: 1.0)
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.frame = self.titleView.bounds
        self.titleView.layer.insertSublayer(gradientLayer, atIndex: 0)
        self.commentView.backgroundColor = UIColorFromRGB(0x282828, aValue: 1.0)
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadTemplate(playlist: Playlist){
        switch(playlist.layoutType){
        case 0:
            let Cview = UINib(nibName: "Layer1", bundle: nil).instantiateWithOwner(self, options: nil)[0]
                as! JaketLayer1View
            Cview.layer.frame = CGRectMake(0, 0, self.homeCellView.bounds.size.width,self.homeCellView.bounds.size.height)
            Cview.layer.position = CGPointMake(self.homeCellView.bounds.size.width/2, self.homeCellView.bounds.size.height/2)
            Cview.playlist = playlist
            self.homeCellView.addSubview(Cview)
            break
        case 1:
            let Cview = UINib(nibName: "Layer2", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer2View
            Cview.layer.frame = CGRectMake(0, 0, self.homeCellView.bounds.size.width,self.homeCellView.bounds.size.height)
            Cview.layer.position = CGPointMake(self.homeCellView.bounds.size.width/2, self.homeCellView.bounds.size.height/2)
            Cview.playlist = playlist
            self.homeCellView.addSubview(Cview)
            break
        case 2:
            let Cview = UINib(nibName: "Layer3", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer3View
            Cview.layer.frame = CGRectMake(0, 0, self.homeCellView.bounds.size.width,self.homeCellView.bounds.size.height)
            Cview.layer.position = CGPointMake(self.homeCellView.bounds.size.width/2, self.homeCellView.bounds.size.height/2)
            Cview.playlist = playlist
            self.homeCellView.addSubview(Cview)
            break
        case 3:
            let Cview = UINib(nibName: "Layer4", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer4View
            Cview.layer.frame = CGRectMake(0, 0, self.homeCellView.bounds.size.width,self.homeCellView.bounds.size.height)
            Cview.layer.position = CGPointMake(self.homeCellView.bounds.size.width/2, self.homeCellView.bounds.size.height/2)
            Cview.playlist = playlist
            self.homeCellView.addSubview(Cview)
            break
        case 4:
            let Cview = UINib(nibName: "Layer5", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer5View
            Cview.layer.frame = CGRectMake(0, 0, self.homeCellView.bounds.size.width,self.homeCellView.bounds.size.height)
            Cview.layer.position = CGPointMake(self.homeCellView.bounds.size.width/2, self.homeCellView.bounds.size.height/2)
            Cview.playlist = playlist
            self.homeCellView.addSubview(Cview)
            break
        case 5:
            let Cview = UINib(nibName: "Layer6", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer6View
            Cview.layer.frame = CGRectMake(0, 0, self.homeCellView.bounds.size.width,self.homeCellView.bounds.size.height)
            Cview.layer.position = CGPointMake(self.homeCellView.bounds.size.width/2, self.homeCellView.bounds.size.height/2)
            Cview.playlist = playlist
            self.homeCellView.addSubview(Cview)
            break
        case 6:
            let Cview = UINib(nibName: "Layer7", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer7View
            Cview.layer.frame = CGRectMake(0, 0, self.homeCellView.bounds.size.width,self.homeCellView.bounds.size.height)
            Cview.layer.position = CGPointMake(self.homeCellView.bounds.size.width/2, self.homeCellView.bounds.size.height/2)
            Cview.playlist = playlist
            self.homeCellView.addSubview(Cview)
            break
        case 7:
            let Cview = UINib(nibName: "Layer8", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer8View
            Cview.layer.frame = CGRectMake(0, 0, self.homeCellView.bounds.size.width,self.homeCellView.bounds.size.height)
            Cview.layer.position = CGPointMake(self.homeCellView.bounds.size.width/2, self.homeCellView.bounds.size.height/2)
            Cview.playlist = playlist
            self.homeCellView.addSubview(Cview)
            break
        default:
            let Cview = UINib(nibName: "Layer1", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! JaketLayer1View
            Cview.layer.frame = CGRectMake(0, 0, self.contentView.bounds.size.width,self.contentView.bounds.size.height)
            Cview.layer.position = CGPointMake(self.contentView.bounds.size.width/2, self.contentView.bounds.size.height/2)
            Cview.playlist = playlist
            self.contentView.addSubview(Cview)
            break

        }
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
