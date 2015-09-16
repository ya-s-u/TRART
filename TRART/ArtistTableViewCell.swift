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
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        artistName.font = UIFont.boldSystemFontOfSize(14)
        artistName.textColor = UIColor.whiteColor()
        
        albumNum.font = UIFont.systemFontOfSize(11)
        albumNum.textColor = UIColor.whiteColor()
        albumNum.text = "8 Albums"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var track: Track? {
        didSet {
            self.artistName.text = self.track!.artist
            
            var url = NSURL(string: self.track!.cover as String!)
            self.coverImage.sd_setImageWithURL(url!)
        }
    }
    
}
