//
//  LayerCell.swift
//  TRART
//
//  Created by itsuki on 2015/09/13.
//  Copyright (c) 2015年 yohei2323. All rights reserved.
//

import UIKit

class LayerCell: UICollectionViewCell {
    
    @IBOutlet var image:[UIImageView] = Array(count: 8, repeatedValue: UIImageView())
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
}