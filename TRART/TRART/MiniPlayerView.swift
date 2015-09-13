//
//  MiniPlayerView.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/13/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class MiniPlayerView: UIView {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var seekBar: UISlider!
    
    func changePlayButtonToStop() {
        self.playButton.setTitle("◼︎", forState: UIControlState.Normal)
    }
    
    func changeStopButtonToPlay() {
        self.playButton.setTitle("▶︎", forState: UIControlState.Normal)
    }
    
    
    
}
