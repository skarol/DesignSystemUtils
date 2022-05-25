//
//  DSView.swift
//
//
//  Created by Karolina Samorek on 15/05/2022.
//

#if canImport(UIKit) && !os(watchOS)
import Combine
import UIKit

/// Simple ``UIView`` with ``AttributedView`` conformance.
public class DSView: UIView {}

extension DSView: AttributedView {
    public typealias Attributes = ViewAttributes

    /// Starts updating stream of attributes on itself.
    ///
    /// Animates changes.
    /// - Parameters:
    ///   - attributes: The stream of attributes to apply.
    ///   - cancellables: Cancellable Set to store updates on.
    public func startUpdating(attributes: AnyPublisher<Attributes, Never>, store cancellables: inout Set<AnyCancellable>) {
        attributes
            .sink(receiveValue: apply)
            .store(in: &cancellables)
    }
}

#endif
