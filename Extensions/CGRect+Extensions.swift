//
//  CGRect+Extensions.swift
//  SwiftUIKitExtensions
//
//  Created by 陈波 on 2022/3/3.
//

import UIKit

public extension CGRect {
    
    /// 锚点坐标参数
    enum Point {
        /// CGPoint
        case point(CGPoint)
        /// 横纵坐标
        case xy(CGFloat, CGFloat)
    }
    
    // 尺寸参数
    enum Size {
        /// 尺寸
        case size(CGSize)
        /// 宽高
        case widthHeight(CGFloat, CGFloat)
        /// 边长
        case sideLenth(CGFloat)
    }
    
    /// 锚点位置
    enum AnchorPoint {
        /// 左上角
        case topLeft
        /// 右上角
        case topRight
        /// 左下角
        case bottomLeft
        /// 右下角
        case bottomRight
        /// 中心点
        case center
        /// 顶边中心点
        case topCenter
        /// 左边中心点
        case leftCenter
        /// 底边中心点
        case bottomCenter
        /// 右边中心点
        case rightCenter
    }
    
    fileprivate typealias FrameLayout = (point: Point, size: Size)
    
    /// CGRect
    /// - Parameters:
    ///   - anchorPoint: 锚点位置
    ///   - point: 锚点参数
    ///   - size: 尺寸参数
    init(anchorPoint: AnchorPoint, point: Point, size: Size) {
        let frameLayout = FrameLayout(point: point, size: size)
        switch frameLayout {
        case (.point(let p), .size(let s)):
            self.init(anchorPoint: anchorPoint, x: p.x, y: p.y, width: s.width, height: s.height)
        case (.point(let p), .widthHeight(let width, let height)):
            self.init(anchorPoint: anchorPoint, x: p.x, y: p.y, width: width, height: height)
        case (.point(let p), .sideLenth(let l)):
            self.init(anchorPoint: anchorPoint, x: p.x, y: p.y, width: l, height: l)
        case (.xy(let x, let y), .size(let s)):
            self.init(anchorPoint: anchorPoint, x: x, y: y, width: s.width, height: s.height)
        case (.xy(let x, let y), .widthHeight(let width, let height)):
            self.init(anchorPoint: anchorPoint, x: x, y: y, width: width, height: height)
        case (.xy(let x, let y), .sideLenth(let l)):
            self.init(anchorPoint: anchorPoint, x: x, y: y, width: l, height: l)
        }
    }
  
    /// CGRect
    /// - Parameters:
    ///   - anchorPoint: 锚点位置
    ///   - x: 锚点X坐标
    ///   - y: 锚点Y坐标
    ///   - width: 宽度
    ///   - height:高度
    init(anchorPoint: AnchorPoint, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        self.init()
        self.size = CGSize(width: width, height: height)
        switch anchorPoint {
        case .topLeft:
            self.origin = CGPoint(x: x, y: y)
        case .topRight:
            self.origin = CGPoint(x: x - width, y: y)
        case .bottomLeft:
            self.origin = CGPoint(x: x, y: y - height)
        case .bottomRight:
            self.origin = CGPoint(x: x - width, y: y - height)
        case .center:
            self.origin = CGPoint(x: x - width / 2.0, y: y - height / 2.0)
        case .topCenter:
            self.origin = CGPoint(x: x - width / 2.0, y: y)
        case .leftCenter:
            self.origin = CGPoint(x: x, y: y - width / 2.0)
        case .bottomCenter:
            self.origin = CGPoint(x: x - width / 2.0, y: y - height)
        case .rightCenter:
            self.origin = CGPoint(x: x - width, y: y - width / 2.0)
        }
    }
}


