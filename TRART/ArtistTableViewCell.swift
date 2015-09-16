//
//  ArtistTableViewCell.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/16/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
