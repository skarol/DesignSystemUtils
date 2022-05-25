//
//  TextAlignment+NSTextAlignment.swift
//  
//
//  Created by Karolina Samorek on 11/05/2022.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit
import SwiftUI

extension TextAlignment {
    /// Creates ``TextAlignment`` from ``TextAlignment``.
    /// Uses ``leading`` for ``left``, ``justified``, ``natural``.
    /// Uses ``center`` for ``center``.
    /// Uses ``right`` for ``trailing``.
    /// Defaults to ``leading``.
    /// - Parameter nsTextAlignement: The text alignment.
    public init(nsTextAlignement: NSTextAlignment) {
        switch nsTextAlignement {
        case .left, .justified, .natural:
            self = .leading
        case .center:
            self = .center
        case .right:
            self = .trailing
        @unknown default:
            self = .leading
        }
    }
}

#endif
