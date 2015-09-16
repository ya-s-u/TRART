//
//  AlbumTableViewCell.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/16/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var trackNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albumName.font = UIFont.boldSystemFontOfSize(14)
        albumName.textColor = UIColor.whiteColor()
        
        trackNum.font = UIFont.systemFontOfSize(11)
        trackNum.textColor = UIColor.whiteColor()
        trackNum.text = "8 Tracks"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var track: Track? {
        didSet {
            self.albumName.text = self.track!.album
            
            var url = NSURL(string: self.track!.cover as String!)
            self.coverImage.sd_setImageWithURL(url!)
        }
    }
    
}
