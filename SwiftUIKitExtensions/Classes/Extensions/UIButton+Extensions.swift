//
//  UIButton+Extensions.swift
//  SwiftUIKitExtensions
//
//  Created by chenb3 on 2021/12/14.
//

import UIKit

fileprivate var closureButtonAssociatedkey = "closureButtonAssociatedkey"

public extension ExtensibleWrapper where Base: UIButton {
    
    /// 标题
    @discardableResult
    func title(_ title: String, for state: UIControl.State) -> Base {
        base.setTitle(title, for: state)
        return base
    }
    
    /// 字体
    @discardableResult
    func titleFont(_ font: UIFont) -> Base {
        base.titleLabel?.font = font
        return base
    }
    
    /// 文本颜色
    @discardableResult
    func textColor(_ textColor: UIColor, for state: UIControl.State) -> Base {
        base.setTitleColor(textColor, for: state)
        return base
    }
    
    /// 图片
    @discardableResult
    func image(_ image: UIImage?, for state: UIControl.State) -> Base {
        base.setImage(image, for: state)
        return base
    }
    
    /// 图片
    @discardableResult
    func image(_ fileName: String, for state: UIControl.State) -> Base {
        base.setImage(UIImage(named: fileName), for: state)
        return base
    }
    
    /// 背景
    @discardableResult
    func backgroundImage(_ image: UIImage?, for state: UIControl.State) -> Base {
        base.setBackgroundImage(image, for: state)
        return base
    }
    
    /// 背景
    @discardableResult
    func backgroundImage(_ fileName: String, for state: UIControl.State) -> Base {
        base.setBackgroundImage(UIImage(named: fileName), for: state)
        return base
    }
    
    /// 添加事件处理
    @discardableResult
    func target(_ target: Any? = nil, action: Selector? = nil) -> Base {
        base.addTarget(target, action: action!, for: .touchUpInside)
        return base
    }
    
    /// 图片高亮变色
    @discardableResult
    func adjustsImageWhenHighlighted(_ allow: Bool) -> Base {
        base.adjustsImageWhenHighlighted = allow
        return base
    }
    
    /// 添加响应事件
    @discardableResult
    func action(for controlEvents: UIControl.Event = .touchUpInside, action:@escaping (UIButton)->()) -> Base {
        objc_setAssociatedObject(base, &closureButtonAssociatedkey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        base.addTarget(base, action: #selector(Base.closureButtonClick), for: controlEvents)
        return base
    }
    
}

public extension UIButton {

    @objc fileprivate func closureButtonClick() {
        if let action = objc_getAssociatedObject(self, &closureButtonAssociatedkey) as? (UIButton)->() {
            action(self)
        }
    }

}
