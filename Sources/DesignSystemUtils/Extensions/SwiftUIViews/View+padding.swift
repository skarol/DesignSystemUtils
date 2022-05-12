//
//  View+padding.swift
//  
//
//  Created by Karolina Samorek on 11/05/2022.
//

import SwiftUI

extension View {
    /// Adds specified padding amount to specific edges of this view.
    /// - Parameter insets: The padding amount for each edge.
    /// - Returns: A view that's padded by the amount you specify.
    @ViewBuilder public func padding(_ insets: LayoutEdgeInsets) -> some View {
        self.padding(.top, insets[.top] ?? insets[.vertical] ?? insets[.all] ?? .zero)
            .padding(.leading, insets[.leading] ?? insets[.horizontal] ?? insets[.all] ?? .zero)
            .padding(.bottom, insets[.bottom] ?? insets[.vertical] ?? insets[.all] ?? .zero)
            .padding(.trailing, insets[.trailing] ?? insets[.horizontal] ?? insets[.all] ?? .zero)
    }
}
