//
//  SizeVariants.swift
//
//
//  Created by Karolina Samorek on 12/04/2022.
//

import Foundation

// public struct ControlStateVariants<Variant> {
//     public var normal: Variant
//     public var highlighted: Variant
//     public var disabled: Variant
//
//     public init(normal: Variant, highlighted: Variant? = nil, disabled: Variant? = nil) {
//         self.normal = normal
//         self.highlighted = highlighted ?? normal
//         self.disabled = disabled ?? normal
//     }
// }


/// Defines a way layout is constructed for different screen sizes.
public struct SizeVariants<Variant> {
    /// The Variant for iPhones 4".
    public var small: Variant
    /// The Variant for iPhone 4.7".
    public var short: Variant
    /// The Variant for the iPhones wider than iPhone 4.7".
    public var compact: Variant
    /// The Variant for all iPads in portrait orientation.
    public var regular: Variant
    /// The Variant for all iPads in landscape orientation.
    public var wide: Variant

    /// Create SizeVariants.
    /// - Parameters:
    ///   - small: The Variant for iPhones 4". If not provided ``short`` is used.
    ///   - short: The Variant for iPhone 4.7". If not provided ``compact`` is used.
    ///   - compact: The Variant for the iPhones wider than iPhone 4.7". If not provided ``regular`` is used.
    ///   - regular: The Variant for all iPads in portrait. Used as a final fallback for each variant if not provided.
    ///   - wide: The Variant for all iPads in landscape. If not provided ``regular`` is used.
    public init(small: Variant? = nil, short: Variant? = nil, compact: Variant? = nil, regular: Variant, wide: Variant? = nil) {
        self.small = small ?? short ?? compact ?? regular
        self.short = short ?? compact ?? regular
        self.compact = compact ?? regular
        self.regular = regular
        self.wide = wide ?? regular
    }
}

public extension SizeVariants {
    /// Returns ``Variant`` for provided screen.
    /// - Parameter screen: The screen for which you want a variant.
    /// - Returns: Variant for provided screen.
    func `for`(screen: Screen) -> Variant {
        if screen.width <= Screen.iPhone4.width {
            return small
        } else if screen.height <= Screen.iPhone47.height {
            return short
        } else if screen.width <= Screen.iPhone67.width {
            return compact
        } else if screen.width >= Screen.iPad79.height, screen.width > screen.height {
            return wide
        }

        return regular
    }
}

extension SizeVariants: Equatable where Variant: Equatable {
    public static func == (lhs: SizeVariants<Variant>, rhs: SizeVariants<Variant>) -> Bool {
        lhs.small == rhs.small
            && lhs.short == rhs.short
            && lhs.compact == rhs.compact
            && lhs.regular == rhs.regular
            && lhs.wide == rhs.wide
    }
}

extension SizeVariants: Hashable where Variant: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(small)
        hasher.combine(short)
        hasher.combine(compact)
        hasher.combine(regular)
        hasher.combine(wide)
    }
}

public extension SizeVariants where Variant == Double {
    static prefix func - (sizeVariant: SizeVariants<Variant>) -> SizeVariants<Variant> {
        .init(
            small: -sizeVariant.small,
            short: -sizeVariant.short,
            compact: -sizeVariant.compact,
            regular: -sizeVariant.regular,
            wide: -sizeVariant.wide
        )
    }
}

public extension SizeVariants where Variant: AdditiveArithmetic {
    static var zero: Self { .init(regular: Variant.zero) }
}
