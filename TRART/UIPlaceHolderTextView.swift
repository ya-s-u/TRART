//
//  UIPlaceHolderTextView.swift
//  TRART
//
//  Created by itsuki on 2015/09/16.
//  Copyright (c) 2015年 yohei2323. All rights reserved.
//

import UIKit

public class UIPlaceHolderTextView: UITextView {
    lazy var placeHolderLabel: UILabel = UILabel()
    
    struct Constants {
        static let defaultiOSplaceHolderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0980392, alpha: 0.22)
    }
    
    public var placeHolder: String = "" {
        didSet {
            placeHolderLabel.text = placeHolder
        }
    }
    
    public var placeHolderColor: UIColor = UIPlaceHolderTextView.Constants.defaultiOSplaceHolderColor {
        didSet {
            placeHolderLabel.textColor = placeHolderColor
        }
    }
    
    override public var font: UIFont! {
        didSet {
            placeHolderLabel.font = font
        }
    }
    
    override public var textAlignment: NSTextAlignment {
        didSet {
            placeHolderLabel.textAlignment = textAlignment
        }
    }
    
    override public var text: String! {
        didSet {
            textDidChange()
        }
    }
    
    override public var attributedText: NSAttributedString! {
        didSet {
            textDidChange()
        }
    }
    
    override public var textContainerInset: UIEdgeInsets {
        didSet {
            updateConstraintsForplaceHolderLabel()
        }
    }
    
    var placeHolderLabelConstraints = [AnyObject]()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "textDidChange",
            name: UITextViewTextDidChangeNotification,
            object: nil)
        
        placeHolderLabel.font = font
        placeHolderLabel.textColor = placeHolderColor
        placeHolderLabel.textAlignment = textAlignment
        placeHolderLabel.text = placeHolder
        placeHolderLabel.numberOfLines = 0
        placeHolderLabel.backgroundColor = UIColor.clearColor()
        placeHolderLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(placeHolderLabel)
        
        updateConstraintsForplaceHolderLabel()
        
    }
    
    func updateConstraintsForplaceHolderLabel() {
        var newConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(\(textContainerInset.left + textContainer.lineFragmentPadding))-[placeHolder]-(\(textContainerInset.right + textContainer.lineFragmentPadding))-|",
            options: nil,
            metrics: nil,
            views: ["placeHolder": placeHolderLabel])
        newConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-(\(textContainerInset.top))-[placeHolder]-(>=\(textContainerInset.bottom))-|",
            options: nil,
            metrics: nil,
            views: ["placeHolder": placeHolderLabel])
        removeConstraints(placeHolderLabelConstraints)
        addConstraints(newConstraints)
        placeHolderLabelConstraints = newConstraints
    }
    
    func textDidChange() {
        placeHolderLabel.hidden = !text.isEmpty
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        placeHolderLabel.preferredMaxLayoutWidth = textContainer.size.width - textContainer.lineFragmentPadding * 2.0
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: UITextViewTextDidChangeNotification,
            object: nil)
    }
    
}
