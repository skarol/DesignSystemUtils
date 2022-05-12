//
//  AttributedView.swift
//  
//
//  Created by Karolina Samorek on 21/04/2022.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit
import Combine

/// View that can apply attributes on itself.
public protocol AttributedView: UIView {
    associatedtype Attributes

    /// Starts updating stream of attributes on itself.
    /// - Parameters:
    ///   - attributes: The stream of attributes to apply.
    ///   - cancellables: Cancellable Set to store updates on.
    func startUpdating(attributes: AnyPublisher<Attributes, Never>, store cancellables: inout Set<AnyCancellable>)
}
#endif
