//
//  ArtistsTableView.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/16/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class ArtistsTableView: UITableView {

    override func awakeFromNib() {
        self.separatorColor = UIColor.rgbColor(0x404040)
        self.layoutMargins = UIEdgeInsetsZero
        self.backgroundView = UIImageView(image: UIImage(named: "Home-backimg"))
    }

}
