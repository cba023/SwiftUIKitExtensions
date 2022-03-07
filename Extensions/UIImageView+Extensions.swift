//
//  UIImageView+Extensions.swift
//  SwiftUIKitExtensions
//
//  Created by chenb3 on 2021/12/14.
//

import UIKit

public extension ExtensibleWrapper where Base: UIImageView {
    
    // 设置图片
    @discardableResult
    func image(_ img: UIImage) -> Base {
        base.image = img
        return base
    }
    
    /// 设置图片
    @discardableResult
    func image(_ name: String) -> Base {
        base.image = UIImage(named: name)
        return base
    }
    
    @discardableResult
    func contentMode(_ mode: UIImageView.ContentMode) -> Base {
        base.contentMode = mode
        return base
    }
}
