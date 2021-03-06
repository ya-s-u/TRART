import UIKit
import PageMenu

class MakeNewController: UIViewController, UINavigationControllerDelegate {
    var pageMenu : CAPSPageMenu?
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    var del =  UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favoriteから曲を選択"
        
        // hide backbutton text
        let backButton = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        // init Playlist
        del.playlist = Playlist()
        
        self.nextButton.enabled = false
        //Receive Nortification from MakeNewController.swift
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "enableNextButton", name: "8TracksSelected", object: nil)
        //Receive Nortification from MakeNewController.swift
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "disableNextButton", name: "8TracksUnSelected", object: nil)
        
        var controllerArray : [UIViewController] = []
    
        var tracksController : TracksTableViewController = TracksTableViewController(nibName: "TracksTableViewController", bundle: nil)
        tracksController.title = "Tracks"
        tracksController.parentNavigationController = self.navigationController
        controllerArray.append(tracksController)
        
        var albumController : AlbumTableViewController = AlbumTableViewController(nibName: "AlbumTableViewController", bundle: nil)
        albumController.title = "Album"
        albumController.parentNavigationController = self.navigationController
        controllerArray.append(albumController)
        
        var artistController : ArtistsTableViewController = ArtistsTableViewController(nibName: "ArtistsTableViewController", bundle: nil)
        artistController.title = "Artist"
        artistController.parentNavigationController = self.navigationController
        controllerArray.append(artistController)
        
        var searchController : SearchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        searchController.title = "Search"
        searchController.parentNavigationController = self.navigationController
        controllerArray.append(searchController)
        
        // Customize menu (Optional)
        var parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(0),
            .ScrollMenuBackgroundColor(UIColor.makeNewTabColorActive()),
            .ViewBackgroundColor(UIColor.makeNewTabColorActive()),
            .BottomMenuHairlineColor(UIColor.makeNewTabColorActive()),
            .SelectionIndicatorColor(UIColor.makeNewTabColorActive()),
            .MenuMargin(10.0),
            .MenuHeight(35.0),
            .SelectedMenuItemLabelColor(UIColor.auditionTextColor()),
            .UnselectedMenuItemLabelColor(UIColor.grayColor()),
            .MenuItemFont(UIFont(name: "HelveticaNeue-Light", size: 17.0)!),
            .UseMenuLikeSegmentedControl(false),
            .MenuItemSeparatorRoundEdges(true),
            .SelectionIndicatorHeight(3.0),
            .MenuItemSeparatorPercentageHeight(0)
        ]
        
        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height
        let navBarHeight = self.navigationController?.navigationBar.frame.size.height
        let navHeight = statusBarHeight + navBarHeight!
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, navHeight, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //---------------------------
    //# MARK: - Segue
    //---------------------------
    
    @IBAction func backToTop(sender: AnyObject) {
        // send notification
        var notification = NSNotification(name: "resetCreatingPlaylist", object: nil)
        NSNotificationCenter.defaultCenter().postNotification(notification)
        
        // stop playing
        PlayerManager.sharedInstance.stop()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func nextButtonAction(sender: AnyObject) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Make", bundle: nil)
        let next: UIViewController = storyboard.instantiateInitialViewController() as! UIViewController
        self.navigationController?.pushViewController(next, animated: true)
        
        var notification = NSNotification(name: "makePlaylist", object: nil)
        NSNotificationCenter.defaultCenter().postNotification(notification)
        
//        // remove player
//        notification  = NSNotification(name: "hidePlaylistPlayer", object: nil)
//        NSNotificationCenter.defaultCenter().postNotification(notification)
//        
//        // stop playing
//        PlayerManager.sharedInstance.stop()
        
        // send notification
        notification = NSNotification(name: "resetCreatingPlaylist", object: nil)
        NSNotificationCenter.defaultCenter().postNotification(notification)
        
        // stop playing
        PlayerManager.sharedInstance.stop()
    }
    
    func enableNextButton() {
        self.nextButton.enabled = true
    }
    
    func disableNextButton() {
        self.nextButton.enabled = false
    }

}
