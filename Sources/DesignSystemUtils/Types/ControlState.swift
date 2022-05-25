//
//  ControlState.swift
//
//
//  Created by Karolina Samorek on 11/05/2022.
//

import Foundation

/// State of UI control.
///
/// Possible options: ``normal``, ``highlighted`` and ``disabled``.
public struct ControlState: OptionSet, Hashable {
    /// Normal UI control's state.
    /// Applicable when no user action is being performed and control is enabled.
    public static let normal = ControlState(rawValue: 1)
    /// Highlighted UI control's state.
    /// Applicable when user taps/presses and control is enabled.
    public static let highlighted = ControlState(rawValue: 2)
    /// Disabled UI control's state.
    /// Applicable when control isn't enabled.
    public static let disabled = ControlState(rawValue: 4)

    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
