import Foundation

class Playlist {
    var title: String?
    var userName: String?
    var description: String?
    var mood: String?
    var tracks: [Track]?
    var layoutType: Int?
    var jacket: [Track]?
    var created = NSDate()
    
    init() {}
    
    init(title: String, userName: String, description: String, mood: String) {
        self.title = title
        self.userName = userName
        self.description = description
        self.mood = mood
    }
}