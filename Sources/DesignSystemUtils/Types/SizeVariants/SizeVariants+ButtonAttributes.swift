//
//  SizeVariants+ButtonAttributes.swift
//
//
//  Created by Karolina Samorek on 13/05/2022.
//

import CoreGraphics
import Foundation

public extension SizeVariants where Variant == ButtonAttributes {
    /// Modifies ``contentInsets`` of each variant.
    /// - Parameter contentInsets: The content insets to modify on each variant.
    /// - Returns:  Modified ``SizeVariants<ButtonAttributes>`` with changed content insets for each variant.
    func with(contentInsets: SizeVariants<LayoutEdgeInsets>) -> SizeVariants<ButtonAttributes> {
        modify(keyPath: \.contentInsets, valueVariants: contentInsets)
    }
}

public extension SizeVariants where Variant == ButtonAttributes.StateAttributes {
    /// Converts ``SizeVariants<ButtonAttributes.StateAttributes>`` to ``SizeVariants<[ControlState: ButtonAttributes.StateAttributes]>``
    /// - Parameter viewAttributes: The view attributes to apply on specific state.
    /// - Returns:  Returns: ``SizeVariants<[ControlState: ButtonAttributes.StateAttributes]>`` with provided view attributes for each state.
    func toStates(viewAttributes: [ControlState: ViewAttributes]) -> SizeVariants<[ControlState: Variant]> {
        convert { stateVariant in
            viewAttributes.keys.reduce(into: [:]) { partialResult, state in
                partialResult[state] = stateVariant.with(viewAttributes: viewAttributes[state] ?? stateVariant.viewAttributes)
            }
        }
    }

    /// Modifies ``cornerRadius`` of each variant.
    /// - Parameter cornerRadius: The corner radius to modify on each variant.
    /// - Returns:  Modified ``SizeVariants<ButtonAttributes.StateAttributes>`` with changed corner radius for each variant.
    func with(cornerRadius: SizeVariants<CGFloat?>) -> Self {
        modify(keyPath: \.viewAttributes.cornerRadius, valueVariants: cornerRadius)
    }
}

public extension SizeVariants where Variant == [ControlState: ButtonAttributes.StateAttributes] {
    /// Converts ``SizeVariants<[ControlState: ButtonAttributes.StateAttributes]>`` to ``SizeVariants<ButtonAttributes>``
    /// - Returns: ``SizeVariants<ButtonAttributes>`` where stateAttributes are self.
    func toButtonAttributes() -> SizeVariants<ButtonAttributes> {
        convert { stateAttributes in
            ButtonAttributes(stateAttributes: stateAttributes)
        }
    }
}
