//
//  View+if.swift
//  
//
//  Created by Karolina Samorek on 11/05/2022.
//

import SwiftUI

extension View {
    /// Applies the given transform if the given condition evaluates to ``true``.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source ``View``.
    /// - Returns: Either the original ``View`` or the modified ``View`` if the condition is ``true``.
    @ViewBuilder public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    /// Applies the given transform if the given parameter evaluates to not ``nil``.
    /// - Parameters:
    ///   - parameter: The parameter to evaluate.
    ///   - transform: The transform to apply to the source ``View``.
    /// - Returns: Either the original ``View`` or the modified ``View`` if the parameter is not ``nil``.
    @ViewBuilder public func `if`<T, Content: View>(_ parameter: T?, transform: (Self, T) -> Content) -> some View {
        if let parameter = parameter {
            transform(self, parameter)
        } else {
            self
        }
    }
}
