//
//  View+wrapInColorSchemes.swift
//  
//
//  Created by Karolina Samorek on 24/05/2022.
//

import SwiftUI

public extension View {
    /// Wraps content into color scheme.
    /// - Parameters:
    ///   - colorSchemes: Color schemes to use. If not provided, uses both ``.light`` and ``.dark``.
    ///   - textColor: Text Color use to describe scheme.
    /// - Returns: Content view wrapped in color schemes.
    @available(macOS 11.0, *)
    @ViewBuilder func wrapInColorSchemes(colorSchemes: [ColorScheme] = [.light, .dark], with textColor: DSColor) -> some View {
        Group {
            ForEach(colorSchemes) { scheme in
                HStack {
                    Text(String(describing: scheme))
                        .foregroundColor(Color(dsColor: textColor))
                        .rotationEffect(.degrees(-90))
                    self
                }
                .preferredColorScheme(scheme)
            }
        }
    }
}

extension ColorScheme: Identifiable {
    public var id: Int {
        self.hashValue
    }
}
