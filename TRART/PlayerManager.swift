import AVFoundation

class PlayerManager {
    // singleton
    static let sharedInstance = PlayerManager()
    
    var audioPlayer : AVAudioPlayer!
    var track: Track? {
        didSet {
            let fileUrl = NSURL(string: self.track!.trackSource)
            let soundData = NSData(contentsOfURL: fileUrl!)
            audioPlayer = AVAudioPlayer(data: soundData, error: nil)
        }
    }
    
//    func set(url: String) {
//        let fileUrl = NSURL(string: url)
//        let soundData = NSData(contentsOfURL: fileUrl!)
//        audioPlayer = AVAudioPlayer(data: soundData, error: nil)
//    }
    
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
    
    func currentTime() -> Double {
        return audioPlayer.currentTime
    }
}