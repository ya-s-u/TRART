import Foundation

class Track {
    let itunesId: Int
    let name: String
    let cover: String
    let artist: String
    let album: String
    let trackSource: String
    let playbackTime: Int
    
    init(dictionary: NSDictionary) {
        self.itunesId = dictionary["trackId"] as! Int
        self.name = dictionary["trackName"] as! String
        self.cover = dictionary["artworkUrl100"] as! String
        self.artist = dictionary["artistName"] as! String
        self.album = dictionary["collectionName"] as! String
        self.trackSource = dictionary["previewUrl"] as! String
        self.playbackTime = dictionary["trackTimeMillis"] as! Int
    }
}