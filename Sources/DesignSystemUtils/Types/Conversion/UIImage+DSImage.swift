//
//  UIImage+DSImage.swift
//  
//
//  Created by Karolina Samorek on 12/05/2022.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

extension UIImage {
    /// Creates ``UIImage`` instance from Design System specific image.
    /// - Parameter dsImage: The Design System specific image.
    public convenience init(dsImage: DSImage) {
        self.init(named: dsImage.name, in: dsImage.bundle, with: nil)!
    }
}

#endif
