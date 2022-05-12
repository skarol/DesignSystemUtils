//
//  LayoutView.swift
//
//
//  Created by Karolina Samorek on 21/04/2022.
//

#if canImport(UIKit) && !os(watchOS)
import Combine
import UIKit

/// Stores ``View`` and it's ``Attributes``.
@propertyWrapper public class LayoutView<View: AttributedView> {
    public var wrappedValue: View
    public let attributes: SizeVariants<View.Attributes>
    public var projectedValue: LayoutView<View> { self }

    private var cancellables: Set<AnyCancellable> = []

    /// Creates Property Wrapper that assign ``Attributes`` for ``View``.
    /// - Parameters:
    ///   - wrappedValue: The ``View`` for which the ``Attributes`` will be assigned.
    ///   - attributes: The ``Attributes`` to assign.
    public init(wrappedValue: View, attributes: SizeVariants<View.Attributes>) {
        self.wrappedValue = wrappedValue
        self.attributes = attributes
    }

    /// Observes ``Layout.screen`` and perform updates when it changes.
    /// - Parameter layout: Layout observable object, to observe.
    public func startObserving(layout: Layout) {
        wrappedValue.startUpdating(
            attributes: layout.$screen
                .map(attributes.for(screen:))
                .eraseToAnyPublisher(),
            store: &cancellables
        )
    }
}
#endif
