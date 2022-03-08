//
//  UIView+Extensions.swift
//  SwiftUIKitExtensions
//
//  Created by chenb3 on 2021/12/14.
//

import UIKit

public extension ExtensibleWrapper where Base: UIView {
    
    /// 设置背景色
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor) -> Base {
        base.backgroundColor = backgroundColor
        return base
    }
    
    /// 设置隐藏
    @discardableResult
    func isHidden(_ hidden: Bool) -> Base {
        base.isHidden = hidden
        return base
    }
}
