import AVFoundation

class PlayerManager: NSObject, AVAudioPlayerDelegate {
    // singleton
    static let sharedInstance = PlayerManager()
    
    var audioPlayer: AVAudioPlayer!
    
    var track: Track? {
        didSet {
            let fileUrl = NSURL(string: self.track!.trackSource)
            let soundData = NSData(contentsOfURL: fileUrl!)
            audioPlayer = AVAudioPlayer(data: soundData, error: nil)
            audioPlayer.delegate = self
        }
    }
    
    func play() {
        if let audioPlayer = audioPlayer {
            audioPlayer.play()
        }
    }
    
    func stop() {
        if let audioPlayer = audioPlayer {
            audioPlayer.pause()
        }
    }
    
    func pos(time: Double) {
        if let audioPlayer = audioPlayer {
            audioPlayer.currentTime = time
        }
    }
    
    func currentTime() -> Double {
        if let audioPlayer = audioPlayer {
            return audioPlayer.currentTime
        }
        return 0.0
    }
    
    func currentTimeStr() -> String {
        if let audioPlayer = audioPlayer {
            let origin = audioPlayer.currentTime
            let min = Int(origin/60)
            let sec = NSString(format: "%02d", Int(origin%60))
            return "\(min):\(sec)"
        }
        return "0:00"
    }
    
    func isPlaying() -> Bool {
        if let audioPlayer = audioPlayer {
            return audioPlayer.playing
        }
        return false
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        audioPlayer.stop()
        
        var notification = NSNotification(name: "finishPlayer", object: nil)
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
}