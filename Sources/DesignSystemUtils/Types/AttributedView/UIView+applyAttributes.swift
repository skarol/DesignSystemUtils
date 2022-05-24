//
//  UIView+applyAttributes.swift
//
//
//  Created by Karolina Samorek on 20/04/2022.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

extension UIView {
    /// Applies View Attributes for given view.
    /// - Parameter attributes: The View Attributes to apply on a view.
    public func apply(attributes: ViewAttributes) {
        if let backgroundColor = attributes.backgroundColor {
            self.backgroundColor = UIColor(dsColor: backgroundColor)
        }
        if let tintColor = attributes.tintColor {
            self.tintColor = UIColor(dsColor: tintColor)
        }
        layer.cornerRadius = attributes.cornerRadius ?? .zero
        if let shadowAttributes = attributes.shadowAttributes {
            apply(attributes: shadowAttributes)
        }
        if let borderAttributes = attributes.borderAttributes {
            apply(attributes: borderAttributes)
        }
    }

    /// Applies border attributes for given view.
    /// - Parameter attributes: The Border Attributes to apply on a view.
    func apply(attributes: BorderAttributes) {
        if let borderColor = attributes.color {
            layer.borderColor = UIColor(dsColor: borderColor).cgColor
        }
        layer.borderWidth = attributes.width
    }

    /// Applies Shadow Attributes for given view.
    /// - Parameter attributes: The Shadow Attributes to apply on a view.
    func apply(attributes: ShadowAttributes) {
        layer.shadowColor = UIColor(dsColor: attributes.color).cgColor
        layer.shadowRadius = attributes.radius
        layer.shadowOpacity = attributes.opacity
        layer.shadowOffset = attributes.offset
    }
}
#endif
