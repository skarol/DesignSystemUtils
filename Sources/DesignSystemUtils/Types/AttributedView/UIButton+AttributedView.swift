//
//  UIButton+AttributedView.swift
//
//
//  Created by Karolina Samorek on 21/04/2022.
//

#if canImport(UIKit) && !os(watchOS)
import Combine
import SwiftUI
import UIKit

extension UIButton: AttributedView {
    public typealias Attributes = ButtonAttributes

    /// Starts updating stream of attributes on itself.
    ///
    /// Observes also own ``isHighlighted`` and  ``isEnabled`` properties, to apply attributes based on control state.
    /// Animates changes.
    /// - Parameters:
    ///   - attributes: The stream of attributes to apply.
    ///   - cancellables: Cancellable Set to store updates on.
    public func startUpdating(attributes: AnyPublisher<Attributes, Never>, store cancellables: inout Set<AnyCancellable>) {
        let currentStatePublisher = publisher(for: \.isHighlighted)
            .combineLatest(publisher(for: \.isEnabled))
            .map { isHighlighted, isEnabled -> ControlState in
                var currentState = ControlState.normal
                if !isEnabled {
                    currentState = .disabled
                } else if isHighlighted {
                    currentState = .highlighted
                }
                return currentState
            }

        attributes
            .combineLatest(currentStatePublisher)
            .sink { attributes, state in
                UIView.animate(withDuration: 0.2) {
                    self.apply(attributes: attributes, for: state)
                }
            }
            .store(in: &cancellables)
    }

    private func apply(attributes: ButtonAttributes, for state: ControlState) {
        imageView?.tintColor = tintColor
        contentEdgeInsets = UIEdgeInsets(insets: attributes.contentInsets)
        if let stateAttributes = attributes.stateAttributes[state] ?? attributes.stateAttributes[.normal] {
            titleLabel?.apply(attributes: stateAttributes.textAttributes)
            apply(attributes: stateAttributes.viewAttributes)
        }
    }
}

#endif
