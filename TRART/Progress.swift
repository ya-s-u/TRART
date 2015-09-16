//
//  Progress.swift
//  TRART
//
//  Created by Yohei Fusayasu on 9/16/15.
//  Copyright (c) 2015 yohei2323. All rights reserved.
//

import Foundation
import SVProgressHUD

class Progress {
    
    class func showProgressWithMessage(message:String){
        SVProgressHUD.setBackgroundColor(UIColor.auditionTextColor())
        SVProgressHUD.showWithStatus(message)
    }
    
    class func stopProgress(){
        SVProgressHUD.dismiss()
    }
    
    class func stopWithSuccessMessage(message:String){
        SVProgressHUD.popActivity()
        SVProgressHUD.showSuccessWithStatus(message)
    }
    
    class func stopWithSuccessMessageImg(image:UIImage,message:String){
        SVProgressHUD.popActivity()
        SVProgressHUD.showImage(image, status: message)
    }
    
    class func stopWithErrorMessage(message:String){
        SVProgressHUD.popActivity()
        SVProgressHUD.showErrorWithStatus(message)
    }
    
    class func dispatch_async_main(block: () -> ()) {
        dispatch_async(dispatch_get_main_queue(), block)
    }
    
    class func dispatch_async_global(block: () -> ()) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
    }
    
}