//
//  UIStackView+Extensions.swift.swift
//  SwiftUIKitExtensions
//
//  Created by chenb3 on 2022/3/8.
//

import UIKit

public extension UIStackView {
    
    struct ArrangedSubviewWrapper {
        
        public var view: UIView
        public var backSpacing: CGFloat
        
        public init(view: UIView, backSpacing: CGFloat = .zero) {
            self.view = view
            self.backSpacing = backSpacing
        }
        
        public init(spacing: CGFloat = .zero) {
            self.view = UIView()
            self.backSpacing = spacing
        }
    }

    convenience init(_ arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = alignment
    }
}


public extension UIView {
    
    @discardableResult
    func stack(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, wrappers: [UIStackView.ArrangedSubviewWrapper]) -> UIStackView {
        let arrangedSubviews = wrappers.map { $0.view }
        let backSpacings = wrappers.map { $0.backSpacing }
        let stackView = UIStackView(arrangedSubviews, axis: axis, spacing: spacing, distribution: distribution, alignment: alignment)
        var insertedSpacingViewCount = 0
        for i in 0..<wrappers.count {
            if #available(iOS 11, *) {
                stackView.setCustomSpacing(backSpacings[i], after: arrangedSubviews[i])
            } else if backSpacings[i] > 0 {
                let spacingView = UIView()
                insertedSpacingViewCount += 1
                stackView.insertArrangedSubview(spacingView, at: i + insertedSpacingViewCount)
                spacingView.heightAnchor.constraint(equalToConstant: backSpacings[i]).isActive = true
            }
        }
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: .zero).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero).isActive = true
        return stackView
    }
    
    @discardableResult
    func stack(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, wrappers: (_ items: inout [UIStackView.ArrangedSubviewWrapper]) -> Void) -> UIStackView {
        var ws: [UIStackView.ArrangedSubviewWrapper] = []
        wrappers(&ws)
        return self.stack(axis: axis, spacing: spacing, distribution: distribution, alignment: alignment, wrappers: ws)
    }

}
