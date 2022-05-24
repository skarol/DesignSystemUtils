//
//  ButtonAttributes.swift
//
//
//  Created by Karolina Samorek on 21/04/2022.
//

import CoreGraphics

/// UI Attributes that can be applied on a button to change it visually.
public struct ButtonAttributes: Equatable, Hashable {
    /// Attributes assigned to certain button ``ControlState``.
    public var stateAttributes: [ControlState: StateAttributes]

    /// Button's content insets.
    public var contentInsets: LayoutEdgeInsets

    /// Creates UI Attributes that can be applied on a button to change it visually.
    /// - Parameters:
    ///   - stateAttributes: Chunk of ``ButtonAttributes`` that is assigned to certain ``ControlState``.
    ///   - contentInsets: Button content insets.
    public init(stateAttributes: [ControlState: StateAttributes], contentInsets: LayoutEdgeInsets = .none) {
        self.stateAttributes = stateAttributes
        self.contentInsets = contentInsets
    }

    /// Creates UI Attributes that can be applied on a button to change it visually.
    /// - Parameters:
    ///   - normalStateAttributes: Chunk of ``ButtonAttributes`` that is assigned to ``ControlState.normal``.
    ///   - contentInsets: Button content insets.
    public init(normalStateAttributes: StateAttributes, contentInsets: LayoutEdgeInsets = .none) {
        self.stateAttributes = [.normal: normalStateAttributes]
        self.contentInsets = contentInsets
    }

    /// Chunk of ``ButtonAttributes`` that is assigned to certain ``ControlState``.
    public struct StateAttributes: Equatable, Hashable {
        public var viewAttributes: ViewAttributes
        public var textAttributes: TextAttributes

        public init(viewAttributes: ViewAttributes, textAttributes: TextAttributes) {
            self.viewAttributes = viewAttributes
            self.textAttributes = textAttributes
        }
    }
}

extension ButtonAttributes.StateAttributes {
    /// Modifies backgroundColor of view attributes.
    /// - Parameter backgroundColor: The background color value to apply.
    /// - Returns: StateAttributes with modified background color.
    public func with(backgroundColor: DSColor?) -> Self {
        var modified = self
        modified.viewAttributes.backgroundColor = backgroundColor
        return modified
    }

    /// Modifies view attributes of button.
    /// - Parameter viewAttributes: The view attributes value to apply.
    /// - Returns: StateAttributes with modified view attributes.
    public func with(viewAttributes: ViewAttributes) -> Self {
        var modified = self
        modified.viewAttributes = viewAttributes
        return modified
    }
}
