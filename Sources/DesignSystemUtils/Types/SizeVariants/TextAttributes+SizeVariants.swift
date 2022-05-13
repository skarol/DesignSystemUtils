//
//  TextAttributes+SizeVariants.swift
//  
//
//  Created by Karolina Samorek on 12/05/2022.
//

import Foundation

public extension SizeVariants where Variant == TextAttributes {
    /// Converts ``SizeVariants<TextAttributes>`` to ``SizeVariants<ButtonAttributes.StateAttributes>``
    /// - Parameter backgroundColor: The background color to apply.
    /// - Returns: ``SizeVariants<ButtonAttributes.StateAttributes>`` where textAttributes are self and viewAttributes are have provided background color.
    func toButtonStateAttributes(withBackgroundColor backgroundColor: DSColor? = nil) -> SizeVariants<ButtonAttributes.StateAttributes> {
        convert { textAttributes in
            ButtonAttributes.StateAttributes(
                viewAttributes: ViewAttributes(backgroundColor: backgroundColor),
                textAttributes: textAttributes
            )
        }
        .modify(keyPath: \.textAttributes, valueVariants: self)
    }
}
