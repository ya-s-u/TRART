import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var track: Track? //TEMP

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        realmSampleUsage()
        return true
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
    
    func realmSampleUsage() {
        // request track data
        let request = iTunesApiClient.Search(term: "akb48")
        iTunesApiClient.sendRequest(request) { response in
            switch response {
            case .Success(let tracks):
                // create playlist
                let playlist = Playlist()
                playlist.setMeta(title: "AKB神曲リスト", userName: "やす", comment: "さっしー最高", mood: "HAPPY")
                playlist.setTracksArr(tracks.value)
                playlist.setJackets(layout: 0, jackets: [
                    tracks.value[0],
                    tracks.value[1],
                    tracks.value[2]
                ])
                
                let realm = Realm()
                println("Realm Path: \(realm.path)")
                
                // save playlist
                realm.write {
                    realm.add(playlist)
                }
                
                // get all playlists
                let playlists = realm.objects(Playlist)
                println("Playlist Count: \(playlists.count)")
                
                for playlist in playlists {
                    println("========== \(playlist.title) ==========")
                    for track in playlist.tracks {
                        println("\(track.name) \(track.playbackTimeStr())")
                    }
                }

            case .Failure(let box):
                // Error Handling
                println("error")
            }
        }
    }

}

