//
//  JaketLayer2View.swift
//  TRART
//
//  Created by itsuki on 2015/09/13.
//  Copyright (c) 2015年 yohei2323. All rights reserved.
//


import UIKit
import SDWebImage

class JaketLayer2View: UIView {
    
    @IBOutlet var image:[UIImageView] = Array(count: 5, repeatedValue: UIImageView())
    
    var playlist: Playlist? {
        didSet{

            for i in 0...4{
                var url = NSURL(string: self.playlist?.jackets[i].cover as String!)
                if i == 4{
                    image[i].layer.shouldRasterize = true
                    image[i].layer.rasterizationScale = 0.1
                }
                image[i].sd_setImageWithURL(url!)
            }
        }
    }
}