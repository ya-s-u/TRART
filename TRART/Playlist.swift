import RealmSwift

class Playlist: Object {
    dynamic var title = ""
    dynamic var userName = ""
    dynamic var comment = ""
    dynamic var mood = ""
    
    dynamic var tracks = List<Track>()
    
    dynamic var layoutType = 0
    dynamic var jackets = List<Track>()
    
    dynamic var created = NSDate()
    
    func setMeta(#title: String, userName: String, comment: String, mood: String) {
        self.title = title
        self.userName = userName
        self.comment = comment
        self.mood = mood
    }
    
    func setTracksArr(tracks: [Track]) {
        for track in tracks {
            self.tracks.append(track)
        }
        self.jackets.append(tracks[0])
        self.jackets.append(tracks[1])
        self.jackets.append(tracks[2])
    }
    
    func setJackets(#layout: Int, jackets: [Track]) {
        self.layoutType = layout
        for jacket in jackets {
            self.jackets.append(jacket)
        }
    }
}