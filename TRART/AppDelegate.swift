import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var track: Track? //TEMP
    var playlist:Playlist!
    
    let realm = Realm()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        playlist = Playlist()

        setDefaultData()
        return true
    }
    
    func setDefaultData() {
        let tracks = realm.objects(Track)
        if tracks.count == 0 {
            setTracks("Avicii")
            setTracks("Afrojack")
            setTracks("Perfume")
        }
    }
    
    func setTracks(term: String) {
        let request = iTunesApiClient.Search(term: term)
        iTunesApiClient.sendRequest(request) { response in
            switch response {
            case .Success(let tracks):
                for track in tracks.value {
                    self.realm.write {
                        self.realm.add(track)
                        println("\(track.name) \(track.playbackTimeStr())")
                    }
                }
                
            case .Failure(let box):
                // Error Handling
                println("iTunesApiClient request error")
            }
        }
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }
}

