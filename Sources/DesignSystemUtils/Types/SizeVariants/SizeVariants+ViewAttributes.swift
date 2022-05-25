//
//  SizeVariants+ViewAttributes.swift
//  
//
//  Created by Karolina Samorek on 15/05/2022.
//

import Foundation

public extension SizeVariants where Variant == ViewAttributes {
    /// Converts ``SizeVariants<ViewAttributes>`` to ``SizeVariants<ImageAttributes>``
    /// - Parameter image: The image to apply on each variant.
    /// - Returns: ``SizeVariants<ImageAttributes>`` where viewAttributes are self and images are as ones passed to the function.
    func toImageAttributes(image: SizeVariants<DSImage?>) -> SizeVariants<ImageAttributes> {
        convert { variant in
            ImageAttributes(viewAttributes: variant, image: image.regular)
        }
        .modify(keyPath: \.image, valueVariants: image)
    }
}
