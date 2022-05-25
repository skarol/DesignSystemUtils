//
//  Layout.swift
//  
//
//  Created by Karolina Samorek on 21/04/2022.
//

import Foundation

/// Contains Publishers for Layout related values, that can change over time.
public final class Layout: ObservableObject {
    /// Stream of current Screen value.
    @Published public var screen: Screen

    /// Creates container for Layout related values, that can change over time.
    /// - Parameter screen: Initial screen value.
    public init(screen: Screen) {
        self.screen = screen
    }
}
