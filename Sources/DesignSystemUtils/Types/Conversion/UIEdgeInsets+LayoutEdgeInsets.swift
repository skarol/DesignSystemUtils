//
//  UIEdgeInsets+LayoutEdgeInsets.swift
//
//
//  Created by Karolina Samorek on 21/04/2022.
//

#if canImport(UIKit)
import UIKit

extension UIEdgeInsets {
    /// Creates ``UIEdgeInsets`` from ``LayoutEdgeInsets``.
    /// - Parameter insets: The LayoutEdgeInsets.
    init(insets: LayoutEdgeInsets) {
        self.init(
            top: insets[.top] ?? insets[.vertical] ?? insets[.all] ?? .zero,
            left: insets[.leading] ?? insets[.horizontal] ?? insets[.all] ?? .zero,
            bottom: insets[.bottom] ?? insets[.vertical] ?? insets[.all] ?? .zero,
            right: insets[.trailing] ?? insets[.horizontal] ?? insets[.all] ?? .zero
        )
    }
}
#endif

