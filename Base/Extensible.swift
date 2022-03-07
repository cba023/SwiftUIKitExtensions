//
//  Extensible.swift
//  Pods-SwiftUIKitExtensions_Example
//
//  Created by chenb3 on 2022/3/4.
//

import UIKit

public struct ExtensibleWrapper<Base> {
    
    let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
    
}

public protocol ExtensibleCompatible {
    
    associatedtype Base

    static var ex: ExtensibleWrapper<Base>.Type { get set }
    
    var ex: ExtensibleWrapper<Base> { get set }
    
}

public extension ExtensibleCompatible {
    
    /// 可扩展属性命名空间（类调用）
    static var ex: ExtensibleWrapper<Self>.Type {
        set {}
        get { ExtensibleWrapper<Self>.self }
    }
    
    /// 可扩展属性命名空间（实例调用）
    var ex: ExtensibleWrapper<Self> {
        set {}
        get { ExtensibleWrapper(self) }
    }
}




