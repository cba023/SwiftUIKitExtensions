//
//  UITextField+Extensions.swift
//  SwiftUIKitExtensions
//
//  Created by chenb3 on 2021/12/14.
//

import UIKit

public extension ExtensibleWrapper where Base: UITextField {
    
    @discardableResult
    func placeholder(_ text: String) -> Base {
        base.placeholder = text
        return base
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Base {
        base.font = font
        return base
    }
    
    @discardableResult
    func text(_ text: String) -> Base {
        base.text = text
        return base
    }
    
    @discardableResult
    func textColor(_ textColor: UIColor) -> Base {
        base.textColor = textColor
        return base
    }
    
    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Base {
        base.textAlignment = textAlignment
        return base
    }
    
    @discardableResult
    func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Base {
        base.borderStyle = borderStyle
        return base
    }

}
