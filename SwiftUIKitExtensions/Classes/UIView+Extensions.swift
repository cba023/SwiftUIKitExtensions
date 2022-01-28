//
//  UIView+Extensions.swift
//  SwiftUIKitExtensions
//
//  Created by chenb3 on 2022/1/28.
//

import Foundation

extension UIView {
    
    @discardableResult
    public func _backgroundColor(_ backgroundColor: UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
}
