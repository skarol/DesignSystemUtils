//
//  DSFont+SizeVariants.swift
//
//
//  Created by Karolina Samorek on 11/05/2022.
//

import Foundation

public extension SizeVariants where Variant == DSFont {
    /// Converts given ``SizeVariants<DSFont>`` to ``SizeVariants<TextAttributes>`` with same text color for each variant.
    /// - Parameter color: The text color to be applied on all variants.
    /// - Returns: ``SizeVariants<TextAttributes>`` with same text color for each variant and variant specific font.
    func toTextAttributes(color: DSColor) -> SizeVariants<TextAttributes> {
        self.convert { font in
            TextAttributes(font: font, color: color)
        }
    }
}
