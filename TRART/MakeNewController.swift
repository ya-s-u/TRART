//
//  MakeNewViewController.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/11/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit
import PageMenu

class MakeNewController: UIViewController {
    var pageMenu : CAPSPageMenu?
    @IBOutlet weak var nextButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favoriteから曲を選択"
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
        
        var albumController : TracksTableViewController = TracksTableViewController(nibName: "TracksTableViewController", bundle: nil)
        albumController.title = "Album"
        albumController.parentNavigationController = self.navigationController
        controllerArray.append(albumController)
        
        var artistController : TracksTableViewController = TracksTableViewController(nibName: "TracksTableViewController", bundle: nil)
        artistController.title = "Artist"
        artistController.parentNavigationController = self.navigationController
        controllerArray.append(artistController)
        
        var usersController : TracksTableViewController = TracksTableViewController(nibName: "TracksTableViewController", bundle: nil)
        usersController.title = "Users"
        usersController.parentNavigationController = self.navigationController
        controllerArray.append(usersController)
        
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
    
    @IBAction func backToTop(sender: AnyObject) {
    }
    
    @IBAction func nextButtonAction(sender: AnyObject) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Make", bundle: nil)
        let next: UIViewController = storyboard.instantiateInitialViewController() as! UIViewController
        self.navigationController?.pushViewController(next, animated: true)
        
        var notification : NSNotification = NSNotification(name: "makePlaylist", object: nil)
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
    
    func enableNextButton() {
        self.nextButton.enabled = true
    }
    
    func disableNextButton() {
        self.nextButton.enabled = false
    }

}
