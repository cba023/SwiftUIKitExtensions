//
//  UITableView+Extensions.swift
//  SwiftUIKitExtensions
//
//  Created by chenb3 on 2022/3/8.
//

import Foundation


public extension ExtensibleWrapper where Base: UITableView  {
    
    /// Reuse cell with nibClass and bundle. (Swift)
    /// - Parameters:
    ///   - nibClass: Nib class
    ///   - bundle: Bundle
    /// - Returns: A cell instance
    func dequeueReusableCell<T: UITableViewCell>(nibClass: T.Type, bundle: Bundle = .main) -> T {

        let className = "\(String(describing: nibClass))"
        var cell = base.dequeueReusableCell(withIdentifier: className)
        if cell == nil {
            cell = (bundle.loadNibNamed(className, owner: nil, options: nil)?.first as! T)
        }
        return cell as! T
        
    }
    
    /// Reuse Cell with any class with bundle. (Swift)
    /// - Parameters:
    ///   - anyClass: Any cell class
    ///   - bundle: Bundle
    /// - Returns: A cell instance
    func dequeueReusableCell<T: UITableViewCell>(anyClass: T.Type, bundle: Bundle = .main) -> T {
        
        let className = "\(String(describing: anyClass))"
        var cell = base.dequeueReusableCell(withIdentifier: className)
        if cell == nil {
            let namespace = bundle.infoDictionary!["CFBundleExecutable"] as! String
            let cls:AnyObject = NSClassFromString(className == NSStringFromClass(UITableViewCell.self) ? className : namespace + "." + className)!
            let initClass = cls as! T.Type
            cell = initClass.init(style: .default, reuseIdentifier: className)
        }
        return cell as! T
        
    }
    
    /// Reuse header or footer with nib and bundle. (Swift)
    /// - Parameters:
    ///   - nibClass: Nib class
    ///   - bundle: Bundle
    /// - Returns: A header or footer instance
    func dequeueReusableHeaderFooterView<T: UIView>(nibClass: T.Type, bundle: Bundle = .main) -> T {
        
        let className = "\(String(describing: nibClass))"
        var headerFooter:UIView? = (base.dequeueReusableHeaderFooterView(withIdentifier: className))
        // 新创建
        if headerFooter == nil {
            headerFooter = ((bundle.loadNibNamed(className, owner: nil, options: nil)?.first) as! UIView)
        }
        return headerFooter as! T
        
    }
    
    /// Reuse header or footer with bundle. (Swift)
    /// - Parameters:
    ///   - anyClass: Any class
    ///   - bundle: Bundle
    /// - Returns: A header or footer instance
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(anyClass: T.Type, bundle: Bundle = .main) -> T {
        
        let className = "\(String(describing: anyClass))"
        var headerFooter:UIView? = base.dequeueReusableHeaderFooterView(withIdentifier: className)
        if headerFooter == nil {
            let namespace = bundle.infoDictionary!["CFBundleExecutable"] as! String
            let cls:AnyObject = NSClassFromString(className == NSStringFromClass(UITableViewHeaderFooterView.self) ? className : namespace + "." + className)!
            let initClass = cls as! T.Type
            headerFooter = initClass.init(reuseIdentifier: className)
        }
        return headerFooter as! T
        
    }
}
