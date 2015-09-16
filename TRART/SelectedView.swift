//
//  SelectedView.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/17/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import UIKit

class SelectedView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var app =  UIApplication.sharedApplication().delegate as! AppDelegate
    let playlistPlayer = PlaylistPlayerManager.sharedInstance
    
    override func awakeFromNib() {
    // Cellに使われるクラスを登録.
    collectionView.registerClass(SelectedTracksCell.self, forCellWithReuseIdentifier: "SelectedTracksCell")
    
    collectionView.delegate = self
    collectionView.dataSource = self
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: SelectedTracksCell = collectionView.dequeueReusableCellWithReuseIdentifier("SelectedTracksCell",
            forIndexPath: indexPath) as! SelectedTracksCell
        
        cell.backgroundColor = UIColor.orangeColor()
        return cell
    }
    
    /*
    Cellが選択された際に呼び出される
    */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        println("Num: \(indexPath.row)")
        
    }


}
