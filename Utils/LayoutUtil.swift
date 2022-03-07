//
//  LayoutUtil.swift
//  SwiftUIKitExtensions
//
//  Created by chenb3 on 2022/1/10.
//

import UIKit

public class LayoutUtil: NSObject {
    
    /// 安全区缩进
    public static var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
        } else {
            return .zero
        }
    }

    /// 安全区底部间距
    public static var safeBottomSpacing: CGFloat {
        return safeAreaInsets.bottom
    }
    
    /// 安全区顶部间距
    public static var safeTopSpacing: CGFloat {
        return safeAreaInsets.top
    }
    
    /// 安全区左间距
    public static var safeLeftSpacing: CGFloat {
        return safeAreaInsets.left
    }
    
    /// 安全区右间距
    public static var safeRightSpacing: CGFloat {
        return safeAreaInsets.right
    }
    
    /// 屏幕尺寸
    public static let screenSize = UIScreen.main.bounds.size
    
    /// 屏幕宽度
    public static var screenWidth: CGFloat {
        return screenSize.width
    }
    
    /// 屏幕高度
    public static var screenHeight: CGFloat {
        return screenSize.height
    }
    
}
