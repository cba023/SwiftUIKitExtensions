//
//  DSL.swift
//  SwiftUIKitExtensions_Example
//
//  Created by chenb3 on 2022/3/8.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

#if os(iOS) || os(tvOS)
    import UIKit
    public typealias ConstraintView = UIView
    public typealias LayoutPriority = UILayoutPriority
    @available(iOS 9.0, *)
    public typealias ConstraintLayoutGuide = UILayoutGuide
#else
    import AppKit
    public typealias ConstraintView = NSView
    public typealias LayoutPriority = NSLayoutConstraint.Priority
    @available(OSX 10.11, *)
    public typealias ConstraintLayoutGuide = NSLayoutGuide
#endif

public protocol LayoutConstraintItem: NSObject {}

private var constraintsKey: UInt8 = 0

extension LayoutConstraintItem {
    internal func prepare() {
        if let view = self as? ConstraintView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    internal var superview: ConstraintView? {
        if let view = self as? ConstraintView {
            return view.superview
        }

        if #available(iOS 9.0, OSX 10.11, *), let guide = self as? ConstraintLayoutGuide {
            return guide.owningView
        }

        return nil
    }

    internal var layoutConstraint: [NSLayoutConstraint] {
        return (constraintsSet as! Set<NSLayoutConstraint>).map({ $0 })
    }

    private var constraintsSet: NSMutableSet {
        let constraintsSet: NSMutableSet
        
        if let existing = objc_getAssociatedObject(self, &constraintsKey) as? NSMutableSet {
            constraintsSet = existing
        } else {
            constraintsSet = NSMutableSet()
            objc_setAssociatedObject(self, &constraintsKey, constraintsSet, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return constraintsSet
    }

    internal func insert(_ constraint: NSLayoutConstraint) {
        constraintsSet.add(constraint)
    }
}

@available(iOS 9.0, OSX 10.11, *)
extension ConstraintLayoutGuide: LayoutConstraintItem {}

extension ConstraintView: LayoutConstraintItem {}

public extension ConstraintView {
    var dsl: ConstraintViewDSL {
        return ConstraintViewDSL(view: self)
    }
}


@resultBuilder
struct ContentBuilder {

    static func buildBlock(_ components: ConstraintViewDSL...) -> [ConstraintViewDSL] {
        return components
    }

    static func buildFinalResult(_ component: [ConstraintViewDSL]) -> [ConstraintView] {
        return component.map({ $0.view })
    }
}

#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

public struct ConstraintViewDSL {
    public var target: AnyObject? {
        return view
    }
    internal let view: ConstraintView

    internal init(view: ConstraintView) {
        self.view = view
    }
    @discardableResult
    func addSubviews(@ContentBuilder dsl: () -> [ConstraintView]) -> Self {
        let views = dsl()
        views.forEach { view.addSubview($0) }
        views.forEach { NSLayoutConstraint.activate($0.layoutConstraint) }
        return self
    }
    
    public func margin(_ attribute: NSLayoutConstraint.Attribute, _ relation: NSLayoutConstraint.Relation = .equal, to item: ConstraintView? = nil, other attr: NSLayoutConstraint.Attribute = .notAnAttribute, _ constant: CGFloat = 0, multiplier m: CGFloat = 1, priority: LayoutPriority? = nil) -> Self {
        
        if view.translatesAutoresizingMaskIntoConstraints {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint = NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: item, attribute: attr, multiplier: m, constant: constant)
        
        if let priority = priority {
            constraint.priority = priority
        }
        view.insert(constraint)
        
        return self
    }
    
    public func align(_ attribute: NSLayoutConstraint.Attribute, _ relation: NSLayoutConstraint.Relation = .equal, to item: ConstraintView, _ constant: CGFloat = 0, multiplier m: CGFloat = 1, priority: LayoutPriority? = nil) -> Self {
        return margin(attribute, relation, to: item, other: attribute, constant, multiplier: m, priority: priority)
    }
    
    public func ratio(_ c: CGFloat = 0, multiplier m: CGFloat = 1, priority: LayoutPriority? = nil) -> Self {
        return margin(.width, .equal, to: view, other: .height, c, multiplier: m, priority: priority)
    }
    
    public func height(_ constant: CGFloat, multiplier m: CGFloat = 1, priority: LayoutPriority? = nil) -> Self {
        return margin(.height, .equal, constant, multiplier: m, priority: priority)
    }
    
    public func width(_ constant: CGFloat, multiplier m: CGFloat = 1, priority: LayoutPriority? = nil) -> Self {
        return margin(.width, .equal, constant, multiplier: m, priority: priority)
    }
}
