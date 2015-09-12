import RealmSwift

class Track: Object {
    dynamic var itunesId = 0
    dynamic var name = ""
    dynamic var cover = ""
    dynamic var artist = ""
    dynamic var album = ""
    dynamic var trackSource = ""
    dynamic var playbackTime = 0

    func playbackTimeStr() -> String {
        let ms = self.playbackTime
        return "\(ms/1000/60)分\(ms/1000%60)秒"
    }
}