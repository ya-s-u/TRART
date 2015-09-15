//
//  JaketLayer1View.swift
//  TRART
//
//  Created by itsuki on 2015/09/13.
//  Copyright (c) 2015年 yohei2323. All rights reserved.
//

import UIKit
import SDWebImage

class JaketLayer1View: UIView {

    @IBOutlet var image:[UIImageView] = Array(count: 3, repeatedValue: UIImageView())
    
    var playlist: Playlist? {
        didSet{
            var cnt = self.playlist?.jackets.count
            for i in 0..<cnt!{
                var url = NSURL(string: self.playlist?.jackets[i].cover as String!)
                image[i].sd_setImageWithURL(url!)
            }
        }
    }
}