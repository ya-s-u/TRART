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
}