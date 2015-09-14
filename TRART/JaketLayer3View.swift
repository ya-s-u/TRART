//
//  JaketLayer3View.swift
//  TRART
//
//  Created by itsuki on 2015/09/13.
//  Copyright (c) 2015年 yohei2323. All rights reserved.
//


import UIKit
import Haneke

class JaketLayer3View: UIView {
    
    @IBOutlet var image:[UIImageView] = Array(count: 6, repeatedValue: UIImageView())
    
    var playlist: Playlist? {
        didSet{
            for i in 0...5{
                var url = NSURL(string: self.playlist?.jackets[i].cover as String!)
                image[i].hnk_setImageFromURL(url!)
            }
        }
    }
}