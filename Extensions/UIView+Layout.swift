//
//  UIView+Layout.swift
//  Pods-SwiftUIKitExtensions_Example
//
//  Created by chenb3 on 2022/3/4.
//

import UIKit

extension UIView: ExtensibleCompatible { }

public extension ExtensibleWrapper where Base: UIView {
    
    var frame: CGRect {
        get {
            return base.frame
        }
        set(newValue) {
            base.frame = newValue
        }
    }
    
    @discardableResult
    func frame(_ frame: CGRect) -> Base {
        base.frame = frame
        return base
    }
    
    /// 尺寸
    var size: CGSize {
        get {
            return base.frame.size
        }
        set(newValue) {
            base.frame.size = newValue
        }
    }
    
    /// 设置尺寸
    @discardableResult
    func size(_ value: CGSize) -> Base {
        var `self` = self
        self.size = value
        return base
    }
    
    /// 宽度
    var width: CGFloat {
        get {
            return base.frame.size.width
        }
        set(newValue) {
            base.frame.size.width = newValue
        }
    }
    
    /// 设置宽度
    @discardableResult
    func width(_ value: CGFloat) -> Base {
        var `self` = self
        self.width = value
        return base
    }
    
    /// 高度
    var height: CGFloat {
        get {
            return base.frame.size.height
        }
        set(newValue) {
            base.frame.size.height = newValue
        }
    }
    
    /// 设置高度
    @discardableResult
    func height(_ value: CGFloat) -> Base {
        var `self` = self
        self.height = value
        return base
    }
    
    /// 横坐标
    var x: CGFloat {
        get {
            return base.frame.minX
        }
        set(newValue) {
            base.frame = CGRect(x: newValue, y: y, width: width, height: height)
        }
    }
    
    /// 设置横坐标
    @discardableResult
    func x(_ value: CGFloat) -> Base {
        var `self` = self
        self.x = value
        return base
    }
    
    /// 纵坐标
    var y: CGFloat {
        get {
            return base.frame.minY
        }
        set(newValue) {
            base.frame = CGRect(x: x, y: newValue, width: width, height: height)
        }
    }
    
    /// 设置纵坐标
    @discardableResult
    func y(_ value: CGFloat) -> Base {
        var `self` = self
        self.y = value
        return base
    }
    
    /// 右端横坐标
    var right: CGFloat {
        get {
            return base.frame.origin.x + base.frame.size.width
        }
        set(newValue) {
            base.frame.origin.x = newValue - base.frame.size.width
        }
    }
    
    /// 设置右侧横坐标
    @discardableResult
    func right(_ value: CGFloat) -> Base {
        var `self` = self
        self.right = value
        return base
    }
    
    /// 底端纵坐标
    var bottom: CGFloat {
        get {
            return base.frame.origin.y + base.frame.size.height
        }
        set(newValue) {
            base.frame.origin.y = newValue - base.frame.size.height
        }
    }
    
    /// 设置底端纵坐标
    @discardableResult
    func bottom(_ value: CGFloat) -> Base {
        var `self` = self
        self.bottom = value
        return base
    }
    
    /// 中心横坐标
    var centerX: CGFloat {
        get {
            return base.center.x
        }
        set(newValue) {
            base.center.x = newValue
        }
    }
    
    /// 设置中心横坐标
    @discardableResult
    func centerX(_ value: CGFloat) -> Base {
        var `self` = self
        self.centerX = value
        return base
    }
    
    /// 中心纵坐标
    var centerY: CGFloat {
        get {
            return base.center.y
        }
        set(newValue) {
            base.center.y = newValue
        }
    }
    
    /// 设置中心纵坐标
    @discardableResult
    func centerY(_ value: CGFloat) -> Base {
        var `self` = self
        self.centerY = value
        return base
    }
    
    /// 中心坐标
    var center: CGPoint {
        get {
            return base.center
        }
        set(newValue) {
            base.center = newValue
        }
    }
    
    /// 设置中心坐标
    @discardableResult
    func center(_ value: CGPoint) -> Base {
        var `self` = self
        self.center = value
        return base
    }
    
    /// 原点
    var origin: CGPoint {
        get {
            return base.frame.origin
        }
        set(newValue) {
            base.frame.origin = newValue
        }
    }
    
    /// 设置原点
    @discardableResult
    func origin(_ value: CGPoint) -> Base {
        var `self` = self
        self.origin = value
        return base
    }
    
    /// 右上角坐标
    var topRight: CGPoint {
        get {
            return CGPoint(x: base.frame.origin.x + base.frame.size.width, y: base.frame.origin.y)
        }
        set(newValue) {
            base.frame.origin = CGPoint(x: newValue.x - self.width, y: newValue.y)
        }
    }
    
    /// 设置右上角坐标
    @discardableResult
    func topRight(_ value: CGPoint) -> Base {
        var `self` = self
        self.topRight = value
        return base
    }
    
    /// 右下角坐标
    var bottomRight: CGPoint {
        get {
            return CGPoint(x: base.frame.origin.x + base.frame.size.width, y: base.frame.origin.y + base.frame.size.height)
        }
        set(newValue) {
            base.frame.origin = CGPoint(x: newValue.x - width, y: newValue.y - height)
        }
    }
    
    /// 设置右下角坐标
    @discardableResult
    func bottomRight(_ value: CGPoint) -> Base {
        var `self` = self
        self.bottomRight = value
        return base
    }
    
    /// 左下角坐标
    var bottomLeft: CGPoint {
        get {
            return CGPoint(x: base.frame.origin.x, y: base.frame.origin.y + base.frame.size.height)
        }
        set(newValue) {
            base.frame.origin = CGPoint(x: newValue.x, y: newValue.y - height)
        }
    }
    
    /// 设置左下角坐标
    @discardableResult
    func bottomLeft(_ value: CGPoint) -> Base {
        var `self` = self
        self.bottomLeft = value
        return base
    }
}
