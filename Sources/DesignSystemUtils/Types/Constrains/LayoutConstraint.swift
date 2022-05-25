//
//  LayoutConstraint.swift
//  
//
//  Created by Karolina Samorek on 23/05/2022.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit
import Combine

/// Adds possibility to update for the Constraint when screen changes.
public class LayoutConstraint<Constraint, Value> {
    private(set) public var constraint: Constraint
    private(set) public var value: SizeVariants<Value>

    var updateClosure: (Constraint, Value) -> Void

    private var cancellables: Set<AnyCancellable> = []

    // todo: make clousure optional
    public init(constraint: Constraint, value: SizeVariants<Value>, update updateClosure: @escaping (Constraint, Value) -> Void) {
        self.constraint = constraint
        self.value = value
        self.updateClosure = updateClosure
    }

    /// Start observing screen and updates itself when screen changes.
    /// - Parameter layout: The layout containing screen.
    func startObserving(layout: Layout) {
        layout.$screen.sink { [unowned self] screen in
            self.updateClosure(self.constraint, self.value.for(screen: screen))
        }
        .store(in: &cancellables)
    }
}

extension Array where Element: LayoutConstraint<NSLayoutConstraint, CGFloat> {
    /// Activates each constrain and start observing layout for screen changes.
    /// - Parameter layout: The layout containing screen.
    public func activateAndObserve(layout: Layout) {
        forEach {
            $0.constraint.isActive = true
            $0.startObserving(layout: layout)
        }
    }
}

extension LayoutConstraint where Constraint: NSLayoutConstraint, Value == CGFloat {
    /// Initialize ``LayoutConstraint`` from ``NSLayoutConstraint`` with constant of type ``CGFloat``.
    /// - Parameters:
    ///   - constraint: Constraint to initialize with.
    ///   - constants: Constant to initialize with.
    public convenience init(constraint: Constraint, multiplier: SizeVariants<Value>) {
        self.init(constraint: constraint, value: multiplier) { _, _ in }
        updateClosure = { constraint, multiplier in
            let isActive = constraint.isActive
            constraint.isActive = false

            let newConstraint = Constraint(
                item: constraint.firstItem as Any,
                attribute: constraint.firstAttribute,
                relatedBy: constraint.relation,
                toItem: constraint.secondItem,
                attribute: constraint.secondAttribute,
                multiplier: multiplier,
                constant: constraint.constant
            )
            newConstraint.priority = constraint.priority
            newConstraint.shouldBeArchived = constraint.shouldBeArchived
            newConstraint.identifier = constraint.identifier

            self.constraint = newConstraint
            newConstraint.isActive = isActive
        }
    }
}

#endif
