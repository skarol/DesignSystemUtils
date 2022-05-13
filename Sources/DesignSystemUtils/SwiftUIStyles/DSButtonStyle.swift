//
//  DSButtonStyle.swift
//  
//
//  Created by Karolina Samorek on 11/05/2022.
//

import SwiftUI

/// Design System Button Style.
///
/// Applies ``ButtonAttributes`` to a button.
public struct DSButtonStyle: ButtonStyle {
    public let attributes: ButtonAttributes

    public init(attributes: ButtonAttributes) {
        self.attributes = attributes
    }

    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ```Button``` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: Configuration) -> some View {
        let currentState: ControlState = configuration.isPressed ? .highlighted : .normal
        let currentStateAttributes = attributes.stateAttributes[currentState] ?? attributes.stateAttributes[.normal]
        configuration.label
            .apply(textAttributes: currentStateAttributes?.textAttributes)
            .padding(attributes.contentInsets)
            .apply(viewAttributes: currentStateAttributes?.viewAttributes)
            .animation(.default, value: configuration.isPressed)
    }
}
