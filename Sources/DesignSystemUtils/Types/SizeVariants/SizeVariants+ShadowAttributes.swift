//
//  SizeVariants+ShadowAttributes.swift
//
//
//  Created by Karolina Samorek on 15/05/2022.
//

import CoreGraphics
import Foundation

public extension SizeVariants where Variant == ShadowAttributes {
    /// Converts ``SizeVariants<ShadowAttributes>`` to ``SizeVariants<ViewAttributes>``
    /// - Parameter cornerRadius: The corner radius to apply on each variant.
    /// - Returns: ``SizeVariants<ViewAttributes>`` where shadowAttributes are self and cornerRadius are as ones passed to the function.
    func toViewAttributes(cornerRadius: CGFloat? = nil) -> SizeVariants<ViewAttributes> {
        convert { variant in
            ViewAttributes(cornerRadius: cornerRadius, shadowAttributes: variant)
        }
    }

    /// Converts ``SizeVariants<ShadowAttributes>`` to ``SizeVariants<ViewAttributes>``
    /// - Parameter cornerRadius: The corner radius to apply on each variant.
    /// - Returns: ``SizeVariants<ViewAttributes>`` where shadowAttributes are self and cornerRadius are as ones passed to the function.
    func toViewAttributes(cornerRadius: SizeVariants<CGFloat?>) -> SizeVariants<ViewAttributes> {
        convert { variant in
            ViewAttributes(cornerRadius: cornerRadius.regular, shadowAttributes: variant)
        }
        .modify(keyPath: \.cornerRadius, valueVariants: cornerRadius)
    }
}
