//
//  Image+DSImage.swift
//  
//
//  Created by Karolina Samorek on 12/05/2022.
//

import SwiftUI

extension Image {
    /// Creates ``Image`` instance from Design System specific image.
    /// - Parameter dsImage: The Design System specific image.
    public init(dsImage: DSImage) {
        self.init(dsImage.name, bundle: dsImage.bundle)
    }
}
