//
//  ImageAttributes.swift
//  
//
//  Created by Karolina Samorek on 15/05/2022.
//

import Foundation

/// UI Attributes that can be applied on an Image View to change it visually.
public struct ImageAttributes: Equatable, Hashable {
    /// View Attributes.
    public var viewAttributes: ViewAttributes
    /// The Image.
    public var image: DSImage?

    /// Creates UI Attributes that can be applied on an Image View to change it visually.
    /// - Parameters:
    ///   - viewAttributes: Attributes to apply on a view.
    ///   - image: The Image.
    public init(viewAttributes: ViewAttributes = ViewAttributes(), image: DSImage? = nil) {
        self.viewAttributes = viewAttributes
        self.image = image
    }
}
