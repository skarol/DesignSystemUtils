//
//  NSTextAlignment+TextAlignment.swift
//  
//
//  Created by Karolina Samorek on 11/05/2022.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit
import SwiftUI

extension NSTextAlignment {
    /// Creates ``NSTextAlignment`` from ``TextAlignment``.
    /// Uses ``left`` for ``leading``.
    /// Uses ``center`` for ``center``.
    /// Uses ``right`` for ``right``.
    /// - Parameter textAlignment: The text alignment.
    public init(textAlignment: TextAlignment) {
        switch textAlignment {
        case .leading:
            self = .left
        case .trailing:
            self = .right
        case .center:
            self = .center
        }
    }
}

#endif
