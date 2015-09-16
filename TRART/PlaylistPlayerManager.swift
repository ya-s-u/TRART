import Foundation

class PlaylistPlayerManager: NSObject {
    // singleton
    static let sharedInstance = PlaylistPlayerManager()
    
    let player = PlayerManager.sharedInstance
    var tracks: [Track] = []
    
    var isPlaying = false
    var currentIndex = 0
    
    override init() {
        super.init()
        
        // receive notification
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "finishPlayer:",
            name: "finishPlayer",
            object: nil
        )
    }
    
    func play() {
        // set track on the first time
        if tracks.count > 0 {
            player.track = tracks[currentIndex]
        }
        println(player.isPlaying())
        player.play()
        isPlaying = true
    }
    
    func stop() {
        player.stop()
        isPlaying = false
    }
    
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func pos(timer: Double) {
        let oldIndex = currentIndex
        currentIndex = Int(timer/30)
        let offset = timer%30
        
        if oldIndex < currentIndex {
            next()
            player.pos(offset)
        } else if oldIndex > currentIndex {
            prev()
            player.pos(offset)
        }
        player.pos(offset)
    }
    
    func next() {
        player.stop()
        if incrCurrentIndex() {
            player.track = tracks[currentIndex]
            player.play()
        } else {
            isPlaying = false
        }
    }
    
    func prev() {
        player.stop()
        if decrCurrentIndex() {
            player.track = tracks[currentIndex]
            player.play()
        } else {
            isPlaying = false
        }
    }
    
    func playing() -> Bool {
        return isPlaying
    }
    
    func currentTimeStr() -> String {
        let trackTime = player.currentTime()
        
        let origin = trackTime + Double(currentIndex*30)
        let min = Int(origin/60)
        let sec = NSString(format: "%02d", Int(origin%60))
        return "\(min):\(sec)"
    }
    
    func totalTimeStr() -> String {
        let origin = tracks.count * 30
        let min = Int(origin/60)
        let sec = NSString(format: "%02d", Int(origin%60))
        return "\(min):\(sec)"
    }
    
    private func incrCurrentIndex() -> Bool {
        if currentIndex < tracks.count-1 {
            currentIndex++
            return true
        }
        return false
    }
    
    private func decrCurrentIndex() -> Bool {
        if currentIndex > 0 {
            currentIndex--
            return true
        }
        return false
    }

    func finishPlayer(sender: AnyObject) {
        next()
        if isPlaying == false {
            currentIndex = 0
            var notification = NSNotification(name: "finishPlaylistPlayer", object: nil)
            NSNotificationCenter.defaultCenter().postNotification(notification)
        }
    }
}