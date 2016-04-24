//
//  DynamicForms.swift
//  DynamicForms
//
//  Created by Benoit Pereira da Silva on 21/04/2015.
//  Copyright (c) 2015 http://pereira-da-silva.com  All rights reserved.

import UIKit

//MARK: Device management

// As a best pratice i consider that we should not distinguish precisely phones
// Size Class should be used to variate the context

public struct D{
    public static let is_PAD = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad
    public static let is_PHONE = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone
    public static let is_UNSPECIFIED = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Unspecified
    public static let SYS_VERSION_FLOAT = (UIDevice.currentDevice().systemVersion as NSString).floatValue
    public static let iOS7 = (D.SYS_VERSION_FLOAT < 8.0 && D.SYS_VERSION_FLOAT >= 7.0)
    public static let iOS8 = (D.SYS_VERSION_FLOAT >= 8.0 && D.SYS_VERSION_FLOAT < 9.0)
    public static let iOS9 = (D.SYS_VERSION_FLOAT >= 9.0 && D.SYS_VERSION_FLOAT < 10.0)
}

// Generic extensions

public extension UIFont {
    func sizeOfString (string: String, constrainedToWidth width: CGFloat) -> CGSize {
        let maxSize=CGSize(width: width, height: CGFloat.max)
        let options : NSStringDrawingOptions = [NSStringDrawingOptions.UsesLineFragmentOrigin , NSStringDrawingOptions.UsesFontLeading]
        return NSString(string: string).boundingRectWithSize(maxSize,
            options: options,
            attributes: [NSFontAttributeName: self], context: nil).size
    }
}

public extension NSMutableAttributedString {
    
    public func setFragmentAsLink(textToFind:String, linkURL:NSURL) -> Bool {
        let foundRange = self.mutableString.rangeOfString(textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(NSLinkAttributeName, value: linkURL, range: foundRange)
            return true
        }
        return false
    }    
}


public extension NSAttributedString {
    
    public func sizeConstrainedToWidth(width: CGFloat) -> CGSize {
        let maxSize=CGSize(width: width, height: CGFloat.max)
        let options : NSStringDrawingOptions = [NSStringDrawingOptions.UsesLineFragmentOrigin , NSStringDrawingOptions.UsesFontLeading]
        return self.boundingRectWithSize(maxSize,
            options: options,
            context: nil).size
    }
}