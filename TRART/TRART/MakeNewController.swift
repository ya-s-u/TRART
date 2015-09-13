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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "曲を選択"
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
            .ScrollMenuBackgroundColor(UIColor.lightGrayColor()),
            .ViewBackgroundColor(UIColor.blackColor()),
            .BottomMenuHairlineColor(UIColor.lightGrayColor()),
            .SelectionIndicatorColor(UIColor.blackColor()),
            .MenuMargin(20.0),
            .MenuHeight(35.0),
            .SelectedMenuItemLabelColor(UIColor.whiteColor()),
            .UnselectedMenuItemLabelColor(UIColor.grayColor()),
            .MenuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 17.0)!),
            .UseMenuLikeSegmentedControl(true),
            .MenuItemSeparatorRoundEdges(true),
            .SelectionIndicatorHeight(4.0),
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
    }

}
