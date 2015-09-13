//
//  JaketLayer1View.swift
//  TRART
//
//  Created by itsuki on 2015/09/13.
//  Copyright (c) 2015年 yohei2323. All rights reserved.
//

import UIKit
import Haneke

class JaketLayer1View: UIView {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    
    var playlist: Playlist? {
        didSet{
            var url = NSURL(string: self.playlist?.jackets[0].cover as String!)
            image1.hnk_setImageFromURL(url!)
        }
    }
}