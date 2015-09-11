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
                        if let track = Track(dictionary: dictionary) {
                            Tracks.append(track)
                        }
                }
            }
            
            return Tracks
        }
    }
        
}