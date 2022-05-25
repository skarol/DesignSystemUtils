//
//  Screen.swift
//  
//
//  Created by Karolina Samorek on 13/04/2022.
//

import SwiftUI

/// Describes Screen size.
public struct Screen {
    /// Screen's width in points.
    public let width: CGFloat
    /// Screen's height in points.
    public let height: CGFloat

    /// Creates type describing Screen size.
    /// - Parameters:
    ///   - width: Screen's width in points.
    ///   - height: Screen's height in points.
    public init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }

    /// Creates type describing Screen size.
    /// - Parameter size: Screen's size in points.
    public init(size: CGSize) {
        self.width = size.width
        self.height = size.height
    }
}

extension Screen {
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, *)
    func rotate(to interfaceOrientation: InterfaceOrientation) -> Screen {
        switch interfaceOrientation {
        case .landscapeLeft, .landscapeRight:
            return Screen(width: height, height: width)
        default:
            return self
        }
    }
}
