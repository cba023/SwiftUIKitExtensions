//
//  TextSizeUtil.swift
//  SwiftUIKitExtensions
//
//  Created by chenb3 on 2021/12/22.
//

import UIKit

/// UI工具
public class TextSizeUtil {
    
    /// 计算文本的高度
    public static func textHeight(_ text: String, font: UIFont, width: CGFloat) -> CGFloat {
        let res = text.boundingRect(with:CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font:font], context:nil).size.height
        return ceil(res + 4.0)
    }
    
    /// 计算文本的宽度
    public static func textWidth(_ text: String, font: UIFont) -> CGFloat {
        let res = text.boundingRect(with:CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font:font], context:nil).size.width
        return ceil(res)
    }
    
    /// 富文本高度
    public static func attributedTextHeight(_ attributedString: NSAttributedString, width: CGFloat) -> CGFloat {
        let height = attributedString.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).height
        return ceil(height)
    }
    
    /// 计算文本的高度(SizeToFit)
    public static func textHeightBySizeToFit(_ text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return ceil(label.frame.height)
    }

}
