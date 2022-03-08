//
//  UIColor+Extensions.swift
//  SwiftUIKitExtensions
//
//  Created by chenb3 on 2021/12/14.
//

import UIKit


extension UIColor: ExtensibleCompatible { }

public extension ExtensibleWrapper where Base: UIColor {
    
    static func hex(_ rgbValue: UInt64, alpha: CGFloat = 1.0) -> UIColor {
        return Base(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha)
    }
    
}
