//
//  DSImage.swift
//  
//
//  Created by Karolina Samorek on 10/05/2022.
//

import Foundation

/// The Design System representation of image resource.
public struct DSImage: Equatable, Hashable {
    public let name: String
    public let bundle: Bundle

    /// Creates a Design System representation of an image resource.
    ///
    /// - Parameters:
    ///   - named: The name of the image resource to lookup, as well as the
    ///     localization key with which to label the image.
    ///   - bundle: The bundle to search for the image resource and localization
    ///     content. Defaults to ``.main``.
    public init(named: String, in bundle: Bundle = .main) {
        self.name = named
        self.bundle = bundle
    }
}
