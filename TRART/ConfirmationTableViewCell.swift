//
//  ConfirmationTableViewCell.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/16/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class ConfirmationTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    var track: Track? {
        didSet {
            trackName.text = self.track!.name
            artistLabel.text = self.track!.artist
            
            var url = NSURL(string: self.track!.cover as String!)
            coverImage.sd_setImageWithURL(url!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        trackName.font = UIFont.boldSystemFontOfSize(14)
        trackName.textColor = UIColor.whiteColor()
        
        artistLabel.font = UIFont.systemFontOfSize(11)
        artistLabel.textColor = UIColor.whiteColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
