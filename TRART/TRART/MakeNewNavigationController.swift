//
//  MakeNewNavigationController.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/11/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import AVFoundation

class MakeNewNavigationController: UINavigationController, AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    let audioPath: NSURL = NSURL(string: "")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // 再生する audio ファイルのパスを取得
//        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sample", ofType: "mp3")!)
//        
//        // auido を再生するプレイヤーを作成する
//        var audioError:NSError?
//        audioPlayer = AVAudioPlayer(contentsOfURL: audioPath, error:&audioError)
//        
//        // エラーが起きたとき
//        if let error = audioError {
//            println("Error \(error.localizedDescription)")
//        }
//        audioPlayer.delegate = self
//        audioPlayer.prepareToPlay()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showMiniPlayer", name: "audition", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showMiniPlayer() {
        let miniPlayer: MiniPlayerView = UINib(nibName: "MiniPlayer", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! MiniPlayerView
        miniPlayer.layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 40.0)
        miniPlayer.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height - 20.0)
        miniPlayer.alpha = 0
        
        self.view.addSubview(miniPlayer)
        
        UIView.animateWithDuration(0.5, animations: {
            miniPlayer.alpha = 1
        })
        
        if ( audioPlayer.playing ){
            audioPlayer.stop()
            miniPlayer.changePlayButtonToStop()
        }
        else{
            audioPlayer.play()
            miniPlayer.changeStopButtonToPlay()
        }
    }
    
}
