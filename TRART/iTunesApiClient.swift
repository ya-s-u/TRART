import APIKit

class iTunesApiClient: API {
    override class var baseURL: NSURL {
        return NSURL(string: "https://itunes.apple.com/search")!
    }
    
    override class var requestBodyBuilder: RequestBodyBuilder {
        return .JSON(writingOptions: nil)
    }
    
    override class var responseBodyParser: ResponseBodyParser {
        return .JSON(readingOptions: nil)
    }
    
    class Search: Request {
        typealias Response = [Track]
        
        let term: String
        
        var URLRequest: NSURLRequest? {
            return iTunesApiClient.URLRequest(
                method: .GET,
                path: "/search/repositories",
                parameters: [
                    "term": term,
                    "limit": 10,
                    "country": "jp",
                    "media": "music",
                    "lang": "ja_jp"
                ]
            )
        }
        
        init(term: String) {
            self.term = term
        }
        
        class func responseFromObject(object: AnyObject) -> Response? {
            var Tracks = [Track]()
            if let dictionaries = object["results"] as? [NSDictionary] {
                for dictionary in dictionaries {
                    let track = Track()
                    track.itunesId = dictionary["trackId"] as! Int
                    track.name = dictionary["trackName"] as! String
                    track.cover = dictionary["artworkUrl100"] as! String
                    track.artist = dictionary["artistName"] as! String
                    track.album = dictionary["collectionName"] as! String
                    track.trackSource = dictionary["previewUrl"] as! String
                    track.playbackTime = dictionary["trackTimeMillis"] as! Int
                    Tracks.append(track)
                }
            }
            
            return Tracks
        }
    }
        
}