//
//  UILabel+Extensions.swift
//  SwiftUIKitExtensions
//
//  Created by chenb3 on 2021/12/14.
//

import UIKit

public extension ExtensibleWrapper where Base: UILabel {
    
    @discardableResult
    func text(_ text: String) -> Base {
        base.text = text
        return base
    }
    
    @discardableResult
    func numberOfLines(_ count: Int) -> Base {
        base.numberOfLines = count
        return base
    }
    
    @discardableResult
    func textColor(_ textColor: UIColor) -> Base {
        base.textColor = textColor
        return base
    }
    
    @discardableResult
    func textColor(_ hex: UInt64) -> Base {
        base.textColor = UIColor.ex.hex(hex)
        return base
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Base {
        base.font = font
        return base
    }
    
    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Base {
        base.textAlignment = textAlignment
        return base
    }
    
    /// 字体高度（保证字体和文本内容存在才有效）
    func unsafeTextHeight(contentWidth: CGFloat) -> CGFloat {
        guard let text = base.text, text.count > 0 else { return 0 }
        guard let font = base.font else { return 0 }
        let h = TextSizeUtil.textHeight(text, font: font, width: contentWidth)
        return h
    }
    
    /// 字体宽度（保证字体和文本内容存在才有效）
    func unsafeTextWidth() -> CGFloat {
        guard let text = base.text, text.count > 0 else { return 0 }
        guard let font = base.font else { return 0 }
        let h = TextSizeUtil.textWidth(text, font: font)
        return h
    }
}
