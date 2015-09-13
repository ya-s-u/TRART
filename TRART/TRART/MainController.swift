//
//  MainController.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/14/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header: MainTableHeaderController = UINib(nibName: "MainTableHeader", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! MainTableHeaderController
        self.tableView.tableHeaderView = header
        
        header.CreateButtonAction(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
