import AVFoundation

class PlayerManager {
    // singleton
    static let sharedInstance = PlayerManager()
    
    var audioPlayer : AVAudioPlayer!
    
    func set(url: String) {
        let fileUrl = NSURL(string: url)
        let soundData = NSData(contentsOfURL: fileUrl!)
        audioPlayer = AVAudioPlayer(data: soundData, error: nil)
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
}